//
//  PlaceDetailViewState.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import MapKit
import SwiftUI

struct PlaceDetailViewState: DynamicProperty {
    private let place: Place

    init(place: Place) {
        self.place = place
    }

    var placeTitle: String {
        place.properties.nazev
    }

    var placeType: String {
        place.properties.druh.rawValue
    }

    var placeImageUrl: URL {
        place.properties.obrId1
    }

    var placeCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: place.geometry.latitude, longitude: place.geometry.longitude)
    }
}
