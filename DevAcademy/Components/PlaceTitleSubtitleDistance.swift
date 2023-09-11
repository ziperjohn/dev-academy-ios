//
//  TitleSubtitleComponent.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 07.08.2023.
//

import MapKit
import SwiftUI

struct PlaceTitleSubtitleDistance: View {
    let title: String
    let subtitle: String
    let titleColor: Color
    let subtitleColor: Color
    let distance: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(titleColor)
                .lineLimit(1)
            HStack {
                Text(subtitle)

                if let distance {
                    Spacer()

                    HStack {
                        Image(systemName: "location.fill")
                        Text(distance)
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
        PlaceTitleSubtitleDistance(title: Places.mock.places[0].properties.name, subtitle: Places.mock.places[0].properties.kind.rawValue, titleColor: .black, subtitleColor: .secondary, distance: "550 m")
    }
}
