//
//  Feature.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import Foundation

struct Place: Equatable {
    let geometry: Point
    let properties: Properties

    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.properties.ogcFid == rhs.properties.ogcFid
    }
}
