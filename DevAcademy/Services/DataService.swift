//
//  DataService.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import Foundation

class DataService {
    static let shared: DataService = .init()

    private init() {}

    var data: Result<Places, Error>?

    func fetchData(completion: @escaping (Result<Places, Error>) -> Void) {
        if let data = data {
            completion(data)
            return
        }

        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            let newData = Result<Places, Error>.success(Places.mock)
            self?.data = newData
            completion(newData)
        }
    }
}
