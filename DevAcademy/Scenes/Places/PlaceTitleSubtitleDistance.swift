//
//  TitleSubtitleComponent.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 07.08.2023.
//

import SwiftUI

struct PlaceTitleSubtitleDistance: View {
    let title: String
    let subtitle: String
    let titleColor: Color
    let subtitleColor: Color
    let coordinate: Point?

    // TODO: Calculate distance from coordinate

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(titleColor)
                .lineLimit(1)
            HStack {
                Text(subtitle)

                if coordinate != nil {
                    Spacer()

                    HStack {
                        Image(systemName: "location.fill")
                        Text("1,8 km")
                    }
                }
            }
            .font(.subheadline)
            .foregroundColor(subtitleColor)
        }
    }
}

struct PlaceTitleSubtitleDistance_Previews: PreviewProvider {
    static var previews: some View {
        PlaceTitleSubtitleDistance(title: Features.mock.features[0].properties.nazev, subtitle: Features.mock.features[0].properties.druh.rawValue, titleColor: .black, subtitleColor: .secondary, coordinate: Features.mock.features[0].geometry)
    }
}
