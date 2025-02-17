//
//  PlaceService.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 15.08.2023.
//

import Foundation

enum APIError: Error {
    case invalidData
    case invalidResponse
    case decodingError(Error)
}

protocol PlacesService {
    func places() async throws -> Places
}

final class ProductionPlacesService: PlacesService {
    func places() async throws -> Places {
        let session = URLSession.shared
        let url = URL(string: "https://gis.brno.cz/ags1/rest/services/OMI/omi_ok_kulturni_instituce/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await session.data(for: request)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        return try JSONDecoder().decode(Places.self, from: data)
    }
}

 final class MockPlacesService: PlacesService {
    func places() async throws -> Places {
        Places.mock
    }
 }
