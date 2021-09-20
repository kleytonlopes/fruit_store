//
//  FruitListViewController.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 17/09/21.
//

import UIKit

class FruitListViewController: UIViewController {
    let fruitListView = FruitsView()
    lazy var shoppingCartButton = ShoppingCartButton()

    var presenter: FruiListPresenterProtocol?

    var goToNextView: (([FruitCellViewModel]) -> Void)?

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "fruit-list-view-title".localized()
        shoppingCartButton.target = self
        shoppingCartButton.action = #selector(self.shoppingCartButtonClicked)
    }
    override func loadView() {
        super.loadView()
        self.view = fruitListView
        fruitListView.presenter = presenter
        self.navigationItem.rightBarButtonItem = shoppingCartButton
        presenter?.loadView()
        definesPresentationContext = true
    }
    @objc func shoppingCartButtonClicked() {
        guard let shoppingCartFruits = presenter?.shoppingCartFruits else {
            return
        }
        if shoppingCartFruits.count > 0 {
            goToNextView?(shoppingCartFruits)
        }
    }
}

extension FruitListViewController: ShoppingCartMenuButton {
    func setQuantity(value: Int) {
        self.shoppingCartButton.setQuantity(value: value)
    }
}
