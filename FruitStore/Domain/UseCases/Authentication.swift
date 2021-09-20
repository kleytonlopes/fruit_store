//
//  Authentication.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

protocol Authentication {
    typealias Result = Swift.Result<AccountModel, DomainError>
    func auth(authenticationModel: AuthenticationModel, completion: @escaping (Result) -> Void)
}

struct AuthenticationModel: Model {
    var email: String
    var password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
