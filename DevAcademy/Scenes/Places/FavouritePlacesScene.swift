//
//  FavouritePlacesScene.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 11.09.2023.
//

import SwiftUI

struct FavouritePlacesScene: View {
    let favouritePlaces: [Place]
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Image(systemName: "chevron.compact.down")
                    .foregroundColor(.secondary)
                    .font(.title)

                Text("Favourite places")
                    .font(.title2)
                    .fontWeight(.semibold)

                Divider()
            }
            List(favouritePlaces, id: \.properties.ogcFid) { place in

                VStack(alignment: .leading) {
                    Text(place.properties.name)
                        .font(.headline)
                    Text(place.properties.kind.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

            }.listStyle(.plain)
        }.padding(.vertical)
    }
}

struct FavouritePlacesScene_Previews: PreviewProvider {
    static var previews: some View {
        FavouritePlacesScene(favouritePlaces: [Places.mock.places[0], Places.mock.places[1]])
    }
}
