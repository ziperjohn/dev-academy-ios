//
//  ImageStorage.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 29.08.2023.
//

import CryptoKit
import Foundation
import SwiftUI

class ImageStorage {
    static let shared: ImageStorage = .init()

    /// Select an folder in this application bundle. We want ideally an "Application Support" directory. In this directory, we want to store our images in subdirectory called "imageCache",
    private let defaultPath: URL = FileManager.default.urls(
        for: .applicationSupportDirectory,
        in: .userDomainMask).first!.appendingPathComponent("imageCache")

    /// Initializer first checks, whether folder for `defaultPath` exists. If not, it creates a new one.
    init() {
        if !FileManager.default.fileExists(atPath: defaultPath.path(percentEncoded: false)) {
            try! FileManager.default.createDirectory(at: defaultPath, withIntermediateDirectories: true)
        }
    }

    /// Takes an URL as a input and produces SHA256 String of the URL as the output.
    ///
    /// We don't use protocol `Hashable` from two reasons. Firstly, the Apple Documentation explicitly forbids to use `Hashable` and `hashValue` for any purpose related to persistence. The hashes are different at each execution for security reasons. Secondly, the 64-bit `Int` is just too short.
    ///
    /// - Parameter url: URL to be hashed
    /// - Returns: Hashed string
    private func hash(of url: URL) -> String {
        let path = url.description.data(using: .utf8)!
        return SHA256.hash(data: path).compactMap { String(format: "%02x", $0) }.joined()
    }

    /// Check, whether file is already cached and if so, returns an Image.
    ///
    /// The function should have following behavior:
    ///  - Hash the URL
    ///  - Check, whether file names by this hash already exists
    ///  - If so, load it and return it as an Image
    ///
    /// - Parameter url: The URL of the request that would be executed upon the server.
    /// - Returns: Image if exists.
    func loadImage(for url: URL) -> Image? {
        let hash = hash(of: url)

        let fileUrl = defaultPath.appendingPathComponent(hash)

        let bytes = try? Data(contentsOf: fileUrl)

        guard let data = bytes else { return nil }

        let uiimage = UIImage(data: data)

        guard let img = uiimage else { return nil }

        return Image(uiImage: img)

        // HINT: Data -> UIImage
        // let uiimage = UIImage(data: data)
    }

    /// Updates image in the cache.
    ///
    /// The function should have following behavior:
    ///  - Hash the URL
    ///  - Remove existring file (if exists)
    ///  - Create a binary data from the image
    ///  - Save the binary data to the file
    ///
    /// - Parameters:
    ///   - image: Image to be stored
    ///   - url: The URL that was executed upon the server to get this image.
    func update(image: UIImage, at url: URL) throws {
        let hash = hash(of: url)

        let fileUrl = defaultPath.appendingPathComponent(hash)

        if FileManager.default.fileExists(atPath: fileUrl.path(percentEncoded: false)) {
            try FileManager.default.removeItem(at: fileUrl)
        }

        guard let bytes = image.jpegData(compressionQuality: 1.0) else { return }

        try bytes.write(to: fileUrl)

        // HINT: UIImage -> Data
        // guard let bytes = image.jpegData(compressionQuality: 1.0) else { return }
    }
}

enum StoredAsyncImageError: Error {
    case decodingFailed
}

struct StoredAsyncImage<I: View, P: View>: View {
    @State private var image: Image?

    private let url: URL
    private let imageBuilder: (Image) -> I
    private let placeholderBuilder: () -> P

    init(url: URL, image: @escaping (Image) -> I, placeholder: @escaping () -> P) {
        self.url = url
        self.imageBuilder = image
        self.placeholderBuilder = placeholder
    }

    private func performURLFetch() async throws -> (UIImage, Image) {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let uiimage = UIImage(data: data) else {
            throw StoredAsyncImageError.decodingFailed
        }
        let image = Image(uiImage: uiimage)

        return (uiimage, image)
    }

    /// Look into the image cache, whether image is already downloaded.
    ///
    /// If so, store it in `image` state variable.
    /// If not, download the image via `performURLFetch()` function, store it in the cache and in the `image` state vriable.
    private func loadImage() async throws {
        let image = ImageStorage.shared.loadImage(for: url)

        if let img = image {
            self.image = img
        } else {
            let result = try await performURLFetch()
            self.image = result.1

            try ImageStorage.shared.update(image: result.0, at: url)
        }
    }

    /// The body should only show one of either states:
    ///
    /// If `image` state variable is filled, present image using `imageBuilder`
    /// If `image` state variable is empty, present `placeholder` and execute `loadImage()` function in the `.task` modifier.
    var body: some View {
        if let img = image {
            imageBuilder(img)
        } else {
            placeholderBuilder().task {
                do {
                    try await loadImage()
                } catch {
                    print(error)
                }
            }
        }
    }
}
