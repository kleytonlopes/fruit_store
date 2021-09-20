//
//  FruitsViewRouter.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 18/09/21.
//

import UIKit

protocol FruitListViewRouter: AnyObject {
    func goToShoppingCart(shoppingCartItems: [FruitCellViewModel])
}

class FruitsViewRouterImplementation: FruitListViewRouter {
    private let nav: NavigationController?
    private let shoppingCartFactory: (_ shoppingCartItems: [FruitCellViewModel]) -> ShoppingCartViewController

    public init(nav: NavigationController, shoppingCartFactory: @escaping (_ shoppingCartItems: [FruitCellViewModel]) -> ShoppingCartViewController) {
        self.nav = nav
        self.shoppingCartFactory = shoppingCartFactory
    }

    public func goToShoppingCart(shoppingCartItems: [FruitCellViewModel]) {
        let viewController = shoppingCartFactory(shoppingCartItems)
        let router = ShoppingCartRouterImplementation(nav: self.nav)
        viewController.goToPDFView = router.downloadPDF
        self.nav?.pushViewController(viewController)
    }
}
