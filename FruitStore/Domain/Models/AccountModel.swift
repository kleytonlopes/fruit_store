//
//  AccountModel.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

public struct AccountModel: Model {
    public var accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
