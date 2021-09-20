//
//  GetFruitsArraySpy.swift
//  FruitStoreTests
//
//  Created by Kleyton Lopes on 20/09/21.
//

import XCTest
@testable import FruitStore

class GetFruitsArraySpy: GetFruitsArray {
    private var addAccountModel: FruitListModel?
    private var completion: ((GetFruitsArray.Result) -> Void)?

    func getFruits(completion: @escaping (GetFruitsArray.Result) -> Void) {
        self.completion = completion
    }
    func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }
    func completeWithFruitsArray(_ fruitList: FruitListModel) {
        completion?(.success(fruitList))
    }
}
