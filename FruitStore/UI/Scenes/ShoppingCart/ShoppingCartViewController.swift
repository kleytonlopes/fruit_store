//
//  ShoppingCartViewController.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 18/09/21.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    // MARK: - Properties
    var presenter: ShoppingCartPresenterProtocol?
    let shoppingCartView = ShoppingCartView()
    var items: [FruitCellViewModel]
    var goToPDFView: ((String) -> Void)?
    lazy var buttonPDF: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(self.handlePDF))
    init() {
        self.items = []
        super.init(nibName: nil, bundle: nil)
    }
    convenience init(items: [FruitCellViewModel]) {
        self.init()
        self.items = items
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - View life cycle
    override func loadView() {
        super.loadView()
        self.view = shoppingCartView
        shoppingCartView.presenter = presenter
        presenter?.updateShoppingCart(items: self.items)
        definesPresentationContext = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "shopping-cart-view-title".localized()
        self.navigationItem.rightBarButtonItem = buttonPDF
    }
    // MARK: - Action Button
    @objc func handlePDF() {
        goToPDFView?(presenter?.descriptionItems ?? "")
    }
}
