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

    func toggleShowFavorite() {
        showFavorites.toggle()
    }

    var places: [Place] {
        placesObject.places
    }

    var arePlacesLoaded: Bool {
        !places.isEmpty
    }

    func fetch() async {
        await placesObject.fetchPlaces()
    }
}
