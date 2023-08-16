//
//  PossibleKind.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import Foundation

enum PossibleKind: RawRepresentable, Decodable {
    init?(rawValue: String) {
        guard let x = Kind(rawValue: rawValue) else {
            self = PossibleKind.unknown(rawValue)
            return
        }

        self = PossibleKind.kind(x)
    }

    typealias RawValue = String

    var rawValue: String {
        switch self {
        case .kind(let temp):
            return temp.rawValue
        case .unknown(let string):
            return string
        }
    }

    case kind(Kind)
    case unknown(String)
}
