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
    var fruitsTableView: FruitsTableView?
    var shoppingCartMenuButton: ShoppingCartMenuButton?
    // MARK: - Properties
    var allFruits = [FruitCellViewModel]()
    var filteredFruits = [FruitCellViewModel]()
    var shoppingCartFruits = [FruitCellViewModel]()
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
    init(getFruitsArray: GetFruitsArray, fruitsTableView: FruitsTableView, menuButton: ShoppingCartMenuButton) {
        self.getFruitsArray = getFruitsArray
        self.fruitsTableView = fruitsTableView
        self.shoppingCartMenuButton = menuButton
    }
    // MARK: - Public Methods
    func loadView() {
        getFruitsArray.getFruits(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure:
                print("Error get Fruits")
            case .success(let data):
                self.allFruits = FruitCellViewModel.fromFruitListModel(fruitListModel: data)
            }
        })
        filteredFruits = allFruits
    }
    func configure(cell: FruitCellView, forRow row: Int) {
        let fruit = filteredFruits[row]
        cell.setData(model: fruit)
    }
    func filterTableViewData(searchText: String) {
        filteredFruits = searchText.isEmpty ? allFruits : allFruits.filter({(data: FruitCellViewModel) -> Bool in
            return data.title.range(of: searchText, options: .caseInsensitive) != nil
        })
        fruitsTableView?.reloadData()
        self.searchText = searchText
    }
    func addItemToShoppingCart(item: FruitCellViewModel) {
        if !shoppingCartFruits.contains(item) {
            shoppingCartFruits.append(item)
            shoppingCartFruits[shoppingCartFruits.count - 1].addItem()
            if let indexOf2 = allFruits.firstIndex(of: item) {
                allFruits[indexOf2].addItem()

            }
        } else {
            if let indexOf = shoppingCartFruits.firstIndex(of: item) {
                shoppingCartFruits[indexOf].addItem()

            }
            if let indexOf2 = allFruits.firstIndex(of: item) {
                allFruits[indexOf2].addItem()
            }
        }
        filterTableViewData(searchText: searchText)
        shoppingCartMenuButton?.setQuantity(value: numberOfSelectedFruits)
    }
    func removeItemFromShoppingCart(item: FruitCellViewModel) {
        if shoppingCartFruits.contains(item) {
            if let indexOf = shoppingCartFruits.firstIndex(of: item) {
                shoppingCartFruits[indexOf].subtractItem()
                if shoppingCartFruits[indexOf].quantity == 0 {
                    shoppingCartFruits.remove(at: indexOf)
                }
            }
            if let indexOf2 = allFruits.firstIndex(of: item) {
                allFruits[indexOf2].subtractItem()
            }
        }
        filterTableViewData(searchText: searchText)
        shoppingCartMenuButton?.setQuantity(value: numberOfSelectedFruits)
    }
}