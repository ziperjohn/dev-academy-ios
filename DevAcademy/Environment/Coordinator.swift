//
//  Coordinator.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    var placesScene: some View {
        PlacesScene()
    }

    var favoritesScene: some View {
        Text("Nic tu není")
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
    }

    func placeDetailScene(with place: Place) -> some View {
        PlaceDetailScene(state: PlaceDetailViewState(place: place))
    }
}
