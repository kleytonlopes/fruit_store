//
//  FruiListPresenterProtocol.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

protocol FruiListPresenterProtocol: AnyObject {
    var numberOfFilteredFruits: Int { get }
    var shoppingCartFruits: [FruitCellViewModel] { get }
    func loadView()
    func configure(cell: FruitCellView, forRow row: Int)
    func filterTableViewData(searchText: String)
    func addItemToShoppingCart(item: FruitCellViewModel)
    func removeItemFromShoppingCart(item: FruitCellViewModel)
}
