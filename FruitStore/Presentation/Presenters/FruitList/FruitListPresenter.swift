//
//  FruitListPresenter.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 17/09/21.
//

import Foundation

class FruiListPresenter: FruiListPresenterProtocol {
    // MARK: - Use Case
    private let getFruitsArray: GetFruitsArray
    // MARK: - UI Protocols
    var fruitsTableView: TableView?
    var shoppingCartMenuButton: ShoppingCartMenuButton?
    var alertView: AlertView?
    // MARK: - Properties
    var allFruits = [FruitCellViewModel]()
    var filteredFruits: [FruitCellViewModel] {
        let filteredFruits = searchText.isEmpty ? allFruits : allFruits.filter({(data: FruitCellViewModel) -> Bool in
            return data.title.range(of: searchText, options: .diacriticInsensitive) != nil
        })
        return filteredFruits
    }
    var shoppingCartFruits: [FruitCellViewModel] {
        let shoppingFruits = allFruits.filter({(data: FruitCellViewModel) -> Bool in
            return data.quantity > 0
        })
        return shoppingFruits
    }
    var searchText: String = ""
    var numberOfFilteredFruits: Int {
        return filteredFruits.count
    }
    var numberOfSelectedFruits: Int {
        var quantity = 0
        shoppingCartFruits.forEach { fruit in
            quantity += fruit.quantity
        }
        return quantity
    }
    // MARK: - Init
    init(
        getFruitsArray: GetFruitsArray,
        fruitsTableView: TableView,
        menuButton: ShoppingCartMenuButton,
        alertView: AlertView) {
        self.getFruitsArray = getFruitsArray
        self.fruitsTableView = fruitsTableView
        self.shoppingCartMenuButton = menuButton
        self.alertView = alertView
    }
    // MARK: - Public Methods
    func loadView() {
        getFruitsArray.getFruits(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure:
                self.alertView?.showMessage(viewModel: AlertViewModel(title: "login-alert-view-error-title".localized(), message: "fruit-list-alert-view-error-message".localized()))
            case .success(let data):
                self.allFruits = FruitCellViewModel.arrayfromFruitListModel(fruitListModel: data)
            }
            self.fruitsTableView?.reloadData()
        })
    }
    func configure(cell: FruitCellView, forRow row: Int) {
        let fruit = filteredFruits[row]
        cell.setData(model: fruit)
    }
    func filterFruits(searchText: String) {
        self.searchText = searchText
        fruitsTableView?.reloadData()
    }
    func addItemToShoppingCart(item: FruitCellViewModel) {
        if let indexOf2 = allFruits.firstIndex(of: item) {
            allFruits[indexOf2].addItem()
        }
        filterFruits(searchText: searchText)
        shoppingCartMenuButton?.setQuantity(value: numberOfSelectedFruits)
    }
    func removeItemFromShoppingCart(item: FruitCellViewModel) {
        guard shoppingCartFruits.contains(item) else {
            return
        }
        if let indexOf2 = allFruits.firstIndex(of: item) {
            allFruits[indexOf2].subtractItem()
        }
        filterFruits(searchText: searchText)
        shoppingCartMenuButton?.setQuantity(value: numberOfSelectedFruits)
    }
}
