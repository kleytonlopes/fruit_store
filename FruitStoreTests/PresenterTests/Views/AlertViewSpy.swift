//
//  AlertViewSpy.swift
//  FruitStoreTests
//
//  Created by Kleyton Lopes on 20/09/21.
//

import XCTest
@testable import FruitStore

class AlertViewSpy: AlertView {
    var emit: ((AlertViewModel) -> Void)?

    func observe(completion: @escaping (AlertViewModel) -> Void) {
        self.emit = completion
    }

    func showMessage(viewModel: AlertViewModel) {
        self.emit?(viewModel)
    }
}
