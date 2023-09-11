//
//  PlacesStateView.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import SwiftUI

struct PlacesStateView: DynamicProperty {
    @EnvironmentObject private var placesObject: PlacesObservableObject
    @State var showFavorites = false

    var places: [Place] {
        placesObject.places
    }

    var favouritePlaces: [Place] {
        if let favouritePlaceIds = placesObject.favouritePlaces {
            return places.filter { place in
                favouritePlaceIds.contains(place.properties.ogcFid)
            }
        }

        return []
    }

    var arePlacesLoaded: Bool {
        !places.isEmpty
    }

    func toggleShowFavorite() {
        showFavorites.toggle()
    }

    func fetch() async {
        await placesObject.fetchPlaces()
    }
}
