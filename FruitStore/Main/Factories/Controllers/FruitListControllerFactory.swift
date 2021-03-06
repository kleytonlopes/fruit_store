//
//  FruitListControllerFactory.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 17/09/21.
//

import Foundation

func makeFruitListController(getFruitsArray: GetFruitsArray) -> FruitListViewController {
    let controller = FruitListViewController()
    let presenter = FruiListPresenter(
        getFruitsArray: getFruitsArray,
        fruitsTableView: WeakVarProxy(controller.fruitListView),
        menuButton: WeakVarProxy(controller),
        alertView: WeakVarProxy(controller))
    controller.presenter = presenter
    return controller
}
