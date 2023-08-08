//
//  Coordinate.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import Foundation
import MapKit

struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D

    init(_ coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
