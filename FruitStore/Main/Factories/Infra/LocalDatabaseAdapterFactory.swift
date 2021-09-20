//
//  LocalDatabaseAdapterFactory.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

func makeDatabaseAdapter() -> FakeFruitDatabaseAdapter {
    return FakeFruitDatabaseAdapter()
}
