//
//  LoginRouter.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 17/09/21.
//

import UIKit

protocol LoginRouter: AnyObject {
    func goToFruitList()
}

class LoginRouterImplementation: LoginRouter {
    private let nav: NavigationController
    private let fruitListFactory: () -> FruitListViewController
    private let shoppingCartFactory: ([FruitCellViewModel]) -> ShoppingCartViewController = { (items) in
        return makeShoppingCartController(items: items)
    }
    public init(nav: NavigationController, fruitListFactory: @escaping () -> FruitListViewController) {
        self.nav = nav
        self.fruitListFactory = fruitListFactory
    }

    public func goToFruitList() {
        DispatchQueue.main.async {
            let fruitsViewController = self.fruitListFactory()
            let fruitsViewRouter = FruitListViewRouterImplementation(nav: self.nav, shoppingCartFactory: self.shoppingCartFactory)
            fruitsViewController.goToNextView = fruitsViewRouter.goToShoppingCart
            self.nav.setRootViewController(fruitsViewController)
        }
    }
}
