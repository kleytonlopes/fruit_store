//
//  ShoppingCartPresenterProtocol.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

protocol ShoppingCartPresenterProtocol: AnyObject {
    var shoppingCartFruits: [FruitCellViewModel] { get }
    var numberOfItems: Int { get }
    var descriptionItems: String { get }
    var totalValue: Float { get }
    func updateShoppingCart(items: [FruitCellViewModel])
    func configure(cell: ShoppingCartCell, forRow row: Int)
}
