//
//  Properties.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import Foundation

struct Properties: Decodable {
    let ogcFid: Int
    let image: String?
    let kind: PossibleKind
    let name: String
    let street: String?
    let identificationNumber: String?
    let phone: String?
    let email: String?
    let web: String?

    enum CodingKeys: String, CodingKey {
        case ogcFid = "ogc_fid"
        case image = "obr_id1"
        case kind = "druh"
        case name = "nazev"
        case street = "ulice"
        case identificationNumber = "cp_co"
        case phone = "telefon"
        case email
        case web
    }

    var imageUrl: URL? {
        guard let image = image, let url = URL(string: image) else {
            return nil
        }

        return url
    }
}
