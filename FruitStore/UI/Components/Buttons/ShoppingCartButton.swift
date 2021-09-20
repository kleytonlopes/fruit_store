//
//  ShoppingCartButton.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 19/09/21.
//

import UIKit

class ShoppingCartButton: UIBarButtonItem {
    private var quantity = 0
    override init() {
        super.init()
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setQuantity(value: Int) {
        self.quantity = value
        setup()
    }
    private func setup() {
        self.title = "\(quantity) \u{1F6D2}"

    }
}
