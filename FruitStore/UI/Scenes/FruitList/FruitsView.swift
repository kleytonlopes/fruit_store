//
//  FruiListView.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 17/09/21.
//

import UIKit

class FruitsView: UIView {
    // MARK: - Properties
    var presenter: FruiListPresenterProtocol?
    lazy var searchController: FruitsSearchController = FruitsSearchController(searchResultsController: nil)
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
extension FruitsView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    func setupConfiguration() {
        tableView.tableHeaderView = searchController.searchBar
        tableView.register(FruitCell.self, forCellReuseIdentifier: FruitCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        searchController.searchResultsUpdater = self
        searchController.edgesForExtendedLayout = .top
        searchController.extendedLayoutIncludesOpaqueBars = true
    }
}
// MARK: - UITableViewDelegate | UITableViewDataSource
extension FruitsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfFilteredFruits ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FruitCell.identifier, for: indexPath) as? FruitCell else {
            return UITableViewCell()
        }
        presenter?.configure(cell: cell, forRow: indexPath.row)
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
// MARK: - UISearchResultsUpdating
extension FruitsView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            presenter?.filterTableViewData(searchText: searchText)
        }
    }
}
// MARK: - FruitsTableView
extension FruitsView: TableView {
    func reloadData() {
        self.tableView.reloadData()
    }
}
// MARK: - FruitCellDelegate
extension FruitsView: FruitCellDelegate {
    func removeItem(item: FruitCellViewModel) {
        presenter?.removeItemFromShoppingCart(item: item)
    }
    func addItem(item: FruitCellViewModel) {
        presenter?.addItemToShoppingCart(item: item)
    }
}
