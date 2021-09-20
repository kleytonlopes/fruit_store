//
//  ShoppingCartCell.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 18/09/21.
//

import UIKit

class ShoppingCartCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "shoppingCartCell"
    lazy var descriptionLabel: UILabel = UILabel()
    lazy var priceLabel: UILabel = UILabel()
    lazy var totalLabel: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodeViewProtocol
extension ShoppingCartCell: CodeViewProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(totalLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
    }
    func setupConstraints() {
        totalLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().inset(5)
            make.right.equalTo(totalLabel.snp.left)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.left.equalTo(descriptionLabel.snp.left)
            make.right.equalTo(descriptionLabel.snp.right)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    func setupConfiguration() {
        totalLabel.textAlignment = .right
        totalLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        priceLabel.font = UIFont.italicSystemFont(ofSize: 15.0)
    }
}

// MARK: - ShoppingCartCellView
extension ShoppingCartCell: ShoppingCartCellView {
    func setData(model: FruitCellViewModel) {
        descriptionLabel.text = "\(model.quantity) x \(model.title)"
        priceLabel.text = model.priceString()
        totalLabel.text = "\(model.totalPriceString())"
    }
}
