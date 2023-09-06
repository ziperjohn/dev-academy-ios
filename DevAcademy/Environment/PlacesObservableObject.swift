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

    private(set) var favouritePlaces: [Int]? {
        get { UserDefaults.standard.array(forKey: "favourites") as? [Int] }
        set {
            UserDefaults.standard.set(newValue, forKey: "favourites")
            updatePlace()
        }
    }

    private var rawPlaces: [Place] = [] {
        didSet { updatePlace() }
    }

    init(placesService: PlacesService) {
        self.placesService = placesService
    }

    func set(place: Place, favourite setFavourite: Bool) {
        var favouritePlaces = self.favouritePlaces ?? []
        let currentIndex = favouritePlaces.firstIndex(of: place.properties.ogcFid)

        switch (setFavourite, currentIndex) {
            case (true, nil):
                favouritePlaces.append(place.properties.ogcFid)
            case (false, let index?):
                favouritePlaces.remove(at: index)
            default:
                return
        }

        self.favouritePlaces = favouritePlaces
    }

    @MainActor
    func fetchPlaces() async {
        do {
            let placesResult = try await placesService.places()
            rawPlaces = placesResult.places
        } catch {
            print(error)
        }
    }

    private func updatePlace() {
        var regularPlaces = rawPlaces
        var presentOnTop: [Place] = []
        let favouritePlaces = self.favouritePlaces ?? []

        regularPlaces.removeAll { place in
            if favouritePlaces.contains(place.properties.ogcFid) {
                presentOnTop.append(place)
                return true
            } else {
                return false
            }
        }

        places = presentOnTop + regularPlaces
    }
}
