//
//  ShoppingCartRouter.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import UIKit

protocol ShoppingCartViewRouter: AnyObject {
    func downloadPDF(descriptionItems: String)
}

class ShoppingCartRouterImplementation: ShoppingCartViewRouter {
    private let nav: NavigationController?
    public init(nav: NavigationController?) {
        self.nav = nav
    }

    func downloadPDF(descriptionItems: String) {
        nav?.present(makePDFActivityViewController(body: descriptionItems), animated: true, completion: nil)    }
}
