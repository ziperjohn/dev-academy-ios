//
//  PlacesRow.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import SwiftUI

struct PlacesRow: View {
    let place: Place

    var body: some View {
        HStack {
            StoredAsyncImage(url: place.properties.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
            } placeholder: {
                Image("placeholder")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
            }

            PlaceTitleSubtitleDistance(title: place.properties.name, subtitle: place.properties.kind.rawValue, titleColor: .black, subtitleColor: .secondary, distance: nil)
        }
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(place: Places.mock.places[0])
    }
}
