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
        place.properties.name
    }

    var placeType: String {
        place.properties.kind.rawValue
    }

    var placeAddress: String {
        guard let street = place.properties.street, let identificationNumber = place.properties.identificationNumber else {
            return ""
        }

        return "\(street) \(identificationNumber)"
    }

    var placeEmail: String? {
        guard let email = place.properties.email else {
            return nil
        }

        return "mailto:\(email)"
    }

    var placePhone: String? {
        guard let phone = place.properties.phone else {
            return nil
        }

        return "tel://:\(phone)"
    }

    var placeWeb: String? {
        guard let web = place.properties.web else {
            return nil
        }

        return web
    }

    var placeImageUrl: URL? {
        guard let image = place.properties.image, let url = URL(string: image) else {
            return nil
        }

        return url
    }

    var placeCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: place.geometry?.latitude ?? 0, longitude: place.geometry?.longitude ?? 0)
    }
}
