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
            AsyncImage(url: place.properties.obrId1) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
            } placeholder: {
                ProgressView()
            }

            PlaceTitleSubtitleDistance(title: place.properties.nazev, subtitle: place.properties.druh.rawValue, titleColor: .black, subtitleColor: .secondary, coordinate: nil)
        }
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(place: Places.mock.features[0])
    }
}
