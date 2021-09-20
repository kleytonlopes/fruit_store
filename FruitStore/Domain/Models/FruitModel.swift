//
//  FruitModel.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

struct FruitModel: Model {
    var identifier: Int
    var name: String
    var imageURL: URL
    var price: Float
    var unit: String
}
