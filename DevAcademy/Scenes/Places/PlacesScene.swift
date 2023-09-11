//
//  PlacesScene.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import ActivityIndicatorView
import SwiftUI

struct PlacesScene: View {
    @EnvironmentObject private var coordinator: Coordinator

    let state = PlacesStateView()

    var body: some View {
        NavigationStack {
            Group {
                if state.arePlacesLoaded {
                    List(state.places, id: \.properties.ogcFid) { place in
                        NavigationLink(destination: coordinator.placeDetailScene(with: place)) {
                            PlacesRow(place: place)
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ActivityIndicatorView(isVisible: .constant(true), type: .growingCircle)
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 150)
                }
            }
            .navigationTitle("Kultůrní mapa Brna")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    state.toggleShowFavorite()
                } label: {
                    Image(systemName: "heart.fill")
                        .imageScale(.large)
                }
            }
        }
        .task {
            await state.fetch()
        }
        .sheet(isPresented: state.$showFavorites) {
            coordinator.favoritesScene(with: state.favouritePlaces)
        }
    }
}

struct PlacesScene_Previews: PreviewProvider {
    static var previews: some View {
        PlacesScene()
            .environmentObject(PlacesObservableObject(placesService: ProductionPlacesService(), userLocationService: ProductionUserLocationService()))
            .environmentObject(Coordinator())
    }
}
