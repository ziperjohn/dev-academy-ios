//
//  Feature.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import Foundation

struct Place: Equatable, Decodable {
    let geometry: Point?
    let properties: Properties

    enum CodingKeys: String, CodingKey {
        case geometry
        case properties = "attributes"
    }

    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.properties.ogcFid == rhs.properties.ogcFid
    }
}
