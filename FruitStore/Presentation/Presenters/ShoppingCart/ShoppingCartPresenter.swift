//
//  ShoppingCartPresenter.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 18/09/21.
//

import Foundation

class ShoppingCartPresenter: ShoppingCartPresenterProtocol {
    // MARK: - UI Protocols
    var shoppingCartTableView: TableView?
    var shoppingCartFruits = [FruitCellViewModel]()
    // MARK: - Properties
    var numberOfItems: Int {
        return shoppingCartFruits.count
    }
    var totalValue: Float {
        var total: Float = 0
        shoppingCartFruits.forEach { fruit in
            total += fruit.totalPrice()
        }
        return total
    }
    var descriptionItems: String {
        var result = "----------NOTA FISCAL ----------\n\n"
        shoppingCartFruits.forEach { fruit in
            result += fruit.toString()
        }
        result += String.init(format: "\nTotal: R$ %.02f", totalValue)

        return result
    }
    // MARK: - Init
    init(shoppingCartTableView: TableView) {
        self.shoppingCartTableView = shoppingCartTableView
    }
    // MARK: - Public Methods
    func updateShoppingCart(items: [FruitCellViewModel]) {
        self.shoppingCartFruits = items
    }
    func configure(cell: ShoppingCartCell, forRow row: Int) {
        let fruit = shoppingCartFruits[row]
        cell.setData(model: fruit)
    }
}
