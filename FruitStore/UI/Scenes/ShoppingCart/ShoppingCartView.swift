//
//  ShoppingCartView.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 18/09/21.
//

import UIKit

class ShoppingCartView: UIView {
    // MARK: - Properties
    let marginView = 15
    var presenter: ShoppingCartPresenterProtocol?
    lazy var tableView: UITableView = UITableView()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - CodeViewProtocol
extension ShoppingCartView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(marginView)
            make.left.equalToSuperview().offset(marginView)
            make.right.equalToSuperview().inset(marginView)
        }
    }
    func setupConfiguration() {
        self.backgroundColor = .white
        tableView.register(ShoppingCartCell.self, forCellReuseIdentifier: ShoppingCartCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension ShoppingCartView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCartCell.identifier, for: indexPath) as? ShoppingCartCell else {
            return UITableViewCell()
        }
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(60.0)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = FooterShoppingCart()
        view.setTotal(value: presenter?.totalValue ?? 0)
        return view
    }
}
// MARK: - ShoppingCartTableView
extension ShoppingCartView: TableView {
    func reloadData() {
        self.tableView.reloadData()

    }
}
