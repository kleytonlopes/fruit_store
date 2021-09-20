//
//  LocalValidator.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

func makeFakeAccountModel() -> AccountModel {
    return AccountModel(accessToken: "any_access_token")
}

class FakeLoginValidatorAdapter: LocalLoginValidator {
    func validate(with userName: String, password: String) -> (Result<Data?, LocalError>) {
        if userName == "Teste" && password == "1234" {
            return .success(makeFakeAccountModel().toData())
        }
        return .failure(.unauthorized)
    }
}
