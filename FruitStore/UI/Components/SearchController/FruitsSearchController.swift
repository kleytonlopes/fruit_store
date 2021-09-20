//
//  SearchController.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 18/09/21.
//

import UIKit

class FruitsSearchController: UISearchController {
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        self.searchBar.sizeToFit()
        self.searchBar.placeholder = "searchbar-placeholder".localized()
        self.searchBar.barStyle = .black
        self.searchBar.searchBarStyle = .minimal
        self.obscuresBackgroundDuringPresentation = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
