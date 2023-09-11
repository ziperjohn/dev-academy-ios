//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import CoreLocation
import Foundation

class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []

    private let placesService: PlacesService
    private let userLocationService: UserLocationService
    private var lastUpdatedLocation: CLLocation?

    private(set) var favouritePlaces: [Int]? {
        get { UserDefaults.standard.array(forKey: "favourites") as? [Int] }
        set {
            UserDefaults.standard.set(newValue, forKey: "favourites")
            updatePlaces()
        }
    }

    private var rawPlaces: [Place] = [] {
        didSet { updatePlaces() }
    }

    init(placesService: PlacesService, userLocationService: UserLocationService) {
        self.placesService = placesService
        self.userLocationService = userLocationService

        userLocationService.listenDidUpdateLocation { [weak self] location in
            DispatchQueue.main.async {
                self?.locationDidUpdate(location: location)
            }
        }

        userLocationService.listenDidUpdateStatus { [weak self] status in
            switch status {
            case .notDetermined: self?.userLocationService.requestAuthorization()
            case .authorizedWhenInUse, .authorizedAlways: self?.beginLocationUpdates()
            default: break
            }
        }
    }

    func getDistance(placeLocation: CLLocation) -> Double? {
        return lastUpdatedLocation?.distance(from: placeLocation)
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

    private func updatePlaces() {
        var regularPlaces = rawPlaces

        if let lastUpdatedLocation {
            regularPlaces.sort { leftPlace, rightPlace in
                guard let rightPoint = rightPlace.geometry?.clLocation else {
                    return false
                }
                guard let leftPoint = leftPlace.geometry?.clLocation else {
                    return true
                }

                return lastUpdatedLocation.distance(from: leftPoint).magnitude < lastUpdatedLocation.distance(from: rightPoint).magnitude
            }
        }

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

    private func beginLocationUpdates() {
        userLocationService.startUpdatingLocation()
    }

    private func shouldUpdate(location: CLLocation) -> Bool {
        lastUpdatedLocation.flatMap { $0.distance(from: location).magnitude > 300 } ?? true
    }

    private func locationDidUpdate(location: [CLLocation]) {
        guard let userLocation = location.first, shouldUpdate(location: userLocation) else { return }
        lastUpdatedLocation = userLocation
        updatePlaces()
    }
}
