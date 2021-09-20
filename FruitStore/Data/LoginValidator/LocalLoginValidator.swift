//
//  LocalLoginValidator.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

protocol LocalLoginValidator {
    func validate(with userName: String, password: String) -> (Result<Data?, LocalError>)
}
