//
//  FruitStoreTests.swift
//  FruitStoreTests
//
//  Created by Kleyton Lopes on 16/09/21.
//

import XCTest
@testable import FruitStore


class FruitListPresenterTests: XCTestCase {
    func test_get_fruits_array_should_show_generic_error_message_if_get_fails() {
        let getFruitsSpy = GetFruitsArraySpy()
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(getFruitsArray: getFruitsSpy, alertView: alertViewSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes."))
            exp.fulfill()
        }
        sut.loadView()
        getFruitsSpy.completeWithError(.unexpected)
        wait(for: [exp], timeout: 2)
    }
}

extension FruitListPresenterTests {
    func makeSut(
        getFruitsArray: GetFruitsArray = GetFruitsArraySpy(),
        fruitsTableView: TableView = TableViewSpy(),
        menuButton: ShoppingCartMenuButton = MenuButtonSpy(),
        alertView: AlertView = AlertViewSpy(),
        file: StaticString = #file,
        line: UInt = #line) -> FruiListPresenter {
        let sut = FruiListPresenter(getFruitsArray: getFruitsArray, fruitsTableView: fruitsTableView, menuButton: menuButton, alertView: alertView)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
