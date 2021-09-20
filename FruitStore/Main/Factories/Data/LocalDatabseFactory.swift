//
//  DatabseFactory.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

func makeLocalDatabase(database: LocalDatabase) -> GetFruitsArray {
    let localGetFruitData = LocalGetFruitData(localDatabase: database)
    return localGetFruitData
}
