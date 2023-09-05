//
//  PlaceDetailViewState.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import MapKit
import SwiftUI

struct PlaceDetailViewState: DynamicProperty {
    @EnvironmentObject private var placesObject: PlacesObservableObject
    private let place: Place

    init(place: Place) {
        self.place = place
    }

    var isFavourite: Binding<Bool> {
        .init {
            placesObject.favouritePlaces?.contains(place.properties.ogcFid) ?? false
        } set: { newValue in
            placesObject.set(place: place, favourite: newValue)
        }
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

    var emailScheme: URL? {
        guard let email = place.properties.email else {
            return nil
        }

        return URL(string: "mailto:\(email)")
    }

    var phoneScheme: URL? {
        guard let phone = place.properties.phone else {
            return nil
        }

        return URL(string: "tel://\(phone)")
    }

    var webUrl: URL? {
        guard let webUrl = place.properties.web else {
            return nil
        }

        if webUrl.hasPrefix("https://") || webUrl.hasPrefix("http://") {
            return URL(string: webUrl)
        } else {
            return URL(string: "http://\(webUrl)")
        }
    }

    var placeImageUrl: URL? {
        guard let image = place.properties.image, let url = URL(string: image) else {
            return nil
        }

        return url
    }

    var placeCoordinate: CLLocationCoordinate2D? {
        guard let latitude = place.geometry?.latitude, let longitude = place.geometry?.longitude else {
            return nil
        }

        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
