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

    func favoritesScene(with favouritePlaces: [Place]) -> some View {
        FavouritePlacesScene(favouritePlaces: favouritePlaces)
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.hidden)
    }

    func placeDetailScene(with place: Place) -> some View {
        PlaceDetailScene(state: PlaceDetailViewState(place: place))
    }
}
