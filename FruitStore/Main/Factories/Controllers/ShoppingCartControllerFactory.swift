//
//  ShoppingCartControllerFactory.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 18/09/21.
//

import Foundation

func makeShoppingCartController(items: [FruitCellViewModel]) -> ShoppingCartViewController {
    let controller = ShoppingCartViewController(items: items)
    let presenter = ShoppingCartPresenter(shoppingCartTableView: controller.shoppingCartView)
    controller.presenter = presenter
    return controller
}
