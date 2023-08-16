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

    enum CodingKeys: String, CodingKey {
        case ogcFid = "ogc_fid"
        case image = "obr_id1"
        case kind = "druh"
        case name = "nazev"
    }

    var imageUrl: URL? {
        guard let image = image, let url = URL(string: image) else {
            return nil
        }

        return url
    }
}
