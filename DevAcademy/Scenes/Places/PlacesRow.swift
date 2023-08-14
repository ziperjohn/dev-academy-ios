//
//  PlacesRow.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import SwiftUI

struct PlacesRow: View {
    let feature: Feature

    var body: some View {
        HStack {
            AsyncImage(url: feature.properties.obrId1) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
            } placeholder: {
                ProgressView()
            }

            PlaceTitleSubtitleDistance(title: feature.properties.nazev, subtitle: feature.properties.druh.rawValue, titleColor: .black, subtitleColor: .secondary, coordinate: nil)
        }
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(feature: Features.mock.features[0])
    }
}
