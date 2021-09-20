//
//  LoginRequest.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

struct LoginRequest: Model {
    var email: String?
    var password: String?

    init(email: String? = nil, password: String? = nil) {
        self.email = email
        self.password = password
    }

    func toAuthenticationModel() -> AuthenticationModel {
        return AuthenticationModel(email: email!, password: password!)
    }
}
