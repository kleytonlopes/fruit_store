//
//  LocalGetFruitData.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

class LocalGetFruitData: GetFruitsArray {
    private let database: LocalDatabase
    init(localDatabase: LocalDatabase) {
        self.database = localDatabase
    }
    func getFruits(completion: @escaping (GetFruitsArray.Result) -> Void) {
        let result = database.getAllFruits()
        switch result {
        case .success(let data):
            if let model: FruitListModel = data?.toModel() {
                completion(.success(model))
            } else {
                completion(.failure(.unexpected))
            }
        case .failure(let error):
            switch error {
            case .unauthorized: completion(.failure(.unauthorized))
            }
        }
    }
}
