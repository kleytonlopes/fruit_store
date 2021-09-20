//
//  WeekVarProxy.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

final class WeakVarProxy<T: AnyObject> {
    private weak var instance: T?

    init(_ instance: T) {
        self.instance = instance
    }
}

extension WeakVarProxy: AlertView where T: AlertView {
    func showMessage(viewModel: AlertViewModel) {
        instance?.showMessage(viewModel: viewModel)
    }
}

extension WeakVarProxy: SignButton where T: SignButton {
    func didSign() {
        instance?.didSign()
    }
}

extension WeakVarProxy: ShoppingCartMenuButton where T: ShoppingCartMenuButton {
    func setQuantity(value: Int) {
        instance?.setQuantity(value: value)
    }

}

extension WeakVarProxy: TableView where T: TableView {
    func reloadData() {
        instance?.reloadData()
    }
}
