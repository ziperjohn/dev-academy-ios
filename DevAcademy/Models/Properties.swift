//
//  Properties.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import Foundation

struct Properties: Decodable {
    let ogcFid: Int
    let image: URL
    let kind: PossibleKind
    let name: String
}
