//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import Foundation

class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []

    private let placesService: PlacesService

    init(placesService: PlacesService) {
        self.placesService = placesService
    }

    @MainActor
    func fetchPlaces() async {
        do {
            let placesResult = try await placesService.places()
            self.places = placesResult.places
        } catch {
            print(error)
        }
    }
}
