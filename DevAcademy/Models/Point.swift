//
//  Point.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import CoreLocation
import Foundation

struct Point: Decodable {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case longitude = "x"
        case latitude = "y"
    }
}

extension Point {
    var clLocation: CLLocation {
        CLLocation(latitude: self.latitude, longitude: self.longitude)
    }
}
