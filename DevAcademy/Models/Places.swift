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
                    name: "Národní divadlo Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2006, longitude: 16.6097),
                properties: Properties(
                    ogcFid: 2,
                    image: "https://picsum.photos/200",
                    kind: .kind(.kino),
                    name: "Kino Art Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2019, longitude: 16.6151),
                properties: Properties(
                    ogcFid: 3,
                    image: "https://picsum.photos/200",
                    kind: .kind(.muzeum),
                    name: "Moravské zemské muzeum"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2079, longitude: 16.5938),
                properties: Properties(
                    ogcFid: 4,
                    image: "https://picsum.photos/200",
                    kind: .kind(.kulturniCentrum),
                    name: "BOUFOU Prostějovská Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2072, longitude: 16.6061),
                properties: Properties(
                    ogcFid: 5,
                    image: "https://picsum.photos/200",
                    kind: .kind(.hudebniKlub),
                    name: "Kabinet múz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1894, longitude: 165602),
                properties: Properties(
                    ogcFid: 6,
                    image: "https://picsum.photos/200",
                    kind: .kind(.knihovna),
                    name: "Moravská zemská knihovna"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1914, longitude: 16.6126),
                properties: Properties(
                    ogcFid: 7,
                    image: "https://picsum.photos/200",
                    kind: .kind(.koncertniHala),
                    name: "Janáčkovo divadlo"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2182, longitude: 16.5893),
                properties: Properties(
                    ogcFid: 8,
                    image: "https://picsum.photos/200",
                    kind: .kind(.kulturniPamátka),
                    name: "Špilberk Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1920, longitude: 16.6071),
                properties: Properties(
                    ogcFid: 9,
                    image: "https://picsum.photos/200",
                    kind: .kind(.letniKino),
                    name: "Letní kino Lužánky"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 10,
                    image: "https://picsum.photos/200",
                    kind: .kind(.podnikSLulturnimProgramem),
                    name: "Bar, který neexistuje"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 11,
                    image: "https://picsum.photos/200",
                    kind: .kind(.kino),
                    name: "Cinema City"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 12,
                    image: "https://picsum.photos/200",
                    kind: .kind(.kino),
                    name: "Univerzitní kino Scala"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 13,
                    image: "https://picsum.photos/200",
                    kind: .kind(.hub),
                    name: "Impact Hub"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 14,
                    image: "https://picsum.photos/200",
                    kind: .kind(.kulturniPamátka),
                    name: "Villa Tugendhat"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 15,
                    image: "https://picsum.photos/200",
                    kind: .kind(.vystaviste),
                    name: "Brněnské výstaviště"
                )
            )
        ]
    )
}
