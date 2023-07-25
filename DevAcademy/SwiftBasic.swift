//
//  SwiftBasic.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 18.07.2023.
//

import Foundation

enum Kind: String {
    case divadlo = "Divadlo"
    case galerie = "Galerie"
    case hub = "Hub"
    case hudebniKlub = "Hudebni klub"
    case kino = "Kino"
    case knihovna = "Knihovna"
    case koncertniHala = "Koncertní hala"
    case kulturniCentrum = "Kulturní centrum"
    case kulturniPamátka = "Kulturní památka"
    case letniKino = "Letní kino"
    case muzeum = "Muzeum"
    case podnikSLulturnimProgramem = "Podnik s kulturním programem"
    case vystaviste = "Výstaviště"
    case ostatni = "Ostatní"
}

enum PossibleKind: RawRepresentable {
    init?(rawValue: String) {
        guard let x = Kind(rawValue: rawValue) else {
            self = PossibleKind.unknown(rawValue)
            return
        }

        self = PossibleKind.kind(x)
    }

    typealias RawValue = String

    var rawValue: String {
        switch self {
        case .kind(let temp):
            return temp.rawValue
        case .unknown(let string):
            return string
        }
    }

    case kind(Kind)
    case unknown(String)
}

struct Properties {
    let ogcFind: Int
    let obrId1: URL
    let druh: PossibleKind
    let nazev: String
}

struct Point {
    let latitude: Double
    let longitude: Double
}

struct Feature {
    let geometry: Point
    let properties: Properties
}

struct Features {
    let features: [Feature]
}

class DataService {
    static let shared: DataService = .init()

    private init() {}

    var data: Result<Features, Error>?

    func fetchData(completion: @escaping (Result<Features, Error>) -> Void) {
        if let data = data {
            completion(data)
            return
        }

        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            let newData = Result<Features, Error>.success(DataService.mockData)
            self?.data = newData
            completion(newData)
        }
    }
}

extension DataService {
    private static var mockData: Features = .init(features: [])
}
