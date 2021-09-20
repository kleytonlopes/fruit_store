//
//  FruitListViewModel.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 17/09/21.
//

import Foundation

struct FruitCellViewModel: Equatable {
    let identifier: Int
    let title: String
    let imageURL: URL
    let price: Float
    let unit: String
    var quantity = 0
}

extension FruitCellViewModel {
    static func == (lhs: FruitCellViewModel, rhs: FruitCellViewModel) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.price == rhs.price && lhs.unit == rhs.unit
    }
    func priceString() -> String {
        return String.init(format: "R$ %.02f %@", price, unit)
    }
    func totalPrice() -> Float {
        return price * Float(quantity)
    }
    func totalPriceString() -> String {
        return String.init(format: "R$ %.02f", totalPrice())
    }
    mutating func addItem() {
        quantity += 1
    }
    mutating func subtractItem() {
        if quantity > 0 {
            quantity -= 1
        }
    }
    func toString() -> String {
        return "\(quantity) x \(title) ---------------------------- \(totalPriceString())\n"
    }
    static func fromFruitListModel(fruitListModel: FruitListModel) -> [FruitCellViewModel] {
        return fruitListModel.fruis.map { fruit in
            return FruitCellViewModel(identifier: fruit.identifier, title: fruit.name, imageURL: fruit.imageURL, price: fruit.price, unit: fruit.unit)
        }
    }
}
