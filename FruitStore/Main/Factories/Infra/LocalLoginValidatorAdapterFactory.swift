//
//  LocalLoginValidatorAdapterFactory.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

func makeLoginValidatorAdapter() -> FakeLoginValidatorAdapter {
    return FakeLoginValidatorAdapter()
}
