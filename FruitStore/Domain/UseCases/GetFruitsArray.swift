//
//  GetFruitsData.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

protocol GetFruitsArray {
    typealias Result = Swift.Result<FruitListModel, DomainError>
    func getFruits(completion: @escaping (Result) -> Void)
}
