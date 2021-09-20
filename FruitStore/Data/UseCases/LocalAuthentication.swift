//
//  LocalAuthentication.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

class LocalAuthentication: Authentication {
    private let loginValidator: LocalLoginValidator

    init(loginValidator: LocalLoginValidator) {
        self.loginValidator = loginValidator
    }
    func auth(authenticationModel: AuthenticationModel, completion: @escaping (Authentication.Result) -> Void) {
        let result = loginValidator.validate(with: authenticationModel.email, password: authenticationModel.password)
        switch result {
        case .success(let data):
            if let model: AccountModel = data?.toModel() {
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
