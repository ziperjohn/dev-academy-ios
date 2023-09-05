//
//  Features.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import Foundation

struct Places: Decodable {
    let places: [Place]

    enum CodingKeys: String, CodingKey {
        case places = "features"
    }
}

extension Places {
    static let mock: Places = .init(
        places: [
            Place(
                geometry: Point(latitude: 49.1913, longitude: 16.6115),
                properties: Properties(
                    ogcFid: 1,
                    image: "https://picsum.photos/200",
                    kind: .kind(.divadlo),
                    name: "Národní divadlo Brno",
                    street: "Rooseveltova",
                    identificationNumber: "31",
                    phone: nil,
                    email: "info@email.com",
                    web: "https://www.ndbrno.cz/"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2006, longitude: 16.6097),
                properties: Properties(
                    ogcFid: 2,
                    image: "https://picsum.photos/200",
                    kind: .kind(.kino),
                    name: "Kino Art Brno",
                    street: "Cihlářská",
                    identificationNumber: "643/19",
                    phone: "777 335 325",
                    email: "info@email.com",
                    web: "https://www.kinoart.cz/cs/program"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2019, longitude: 16.6151),
                properties: Properties(
                    ogcFid: 3,
                    image: "https://picsum.photos/200",
                    kind: .kind(.muzeum),
                    name: "Moravské zemské muzeum",
                    street: "Zelný trh",
                    identificationNumber: "6",
                    phone: "777 335 325",
                    email: "info@email.com",
                    web: "http://www.mzm.cz/"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2072, longitude: 16.6061),
                properties: Properties(
                    ogcFid: 5,
                    image: "https://picsum.photos/200",
                    kind: .kind(.hudebniKlub),
                    name: "Kabinet múz",
                    street: "Sukova",
                    identificationNumber: "49/4",
                    phone: "777 335 325",
                    email: "info@email.com",
                    web: "https://www.kabinetmuz.cz/"
                )
            )
        ]
    )
}
