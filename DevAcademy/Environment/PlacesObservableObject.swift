//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import Foundation

class PlacesObservableObject: ObservableObject {
    @Published var place: [Place] = []

    private let dataService: DataService = .shared

    func fetchPlaces() {
        dataService.fetchData { result in
            switch result {
            case .success(let places):
                self.place = places.features
            case .failure(let error):
                print(error)
            }
        }
    }
}
