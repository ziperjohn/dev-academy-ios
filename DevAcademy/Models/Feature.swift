//
//  Feature.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import Foundation

struct Feature: Equatable {
    let geometry: Point
    let properties: Properties

    static func == (lhs: Feature, rhs: Feature) -> Bool {
        lhs.properties.ogcFid == rhs.properties.ogcFid
    }
}
