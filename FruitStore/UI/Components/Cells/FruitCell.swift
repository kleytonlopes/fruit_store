//
//  FruitCell.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 17/09/21.
//

import UIKit
import SDWebImage

protocol FruitCellDelegate: AnyObject {
    func addItem(item: FruitCellViewModel)
    func removeItem(item: FruitCellViewModel)
}

class FruitCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "fruitCell"

    let sizeImageView = 50
    let borderWidthImageView: CGFloat = 2.0
    let buttonHeight = 40
    let paddingView = 15
    var currentItem: FruitCellViewModel?
    lazy var addButton: UIButton = UIButton()
    lazy var removeButton: UIButton = UIButton()
    lazy var titleLabel: UILabel = UILabel()
    lazy var priceLabel: UILabel = UILabel()
    lazy var fruitImageView = UIImageView()
    weak var delegate: FruitCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    @objc private func addItem() {
        if let item = currentItem {
            delegate?.addItem(item: item)
        }
    }
    @objc private func removeItem() {
        if let item = currentItem {
            delegate?.removeItem(item: item)
        }
    }
}

// MARK: - CodeViewProtocol
extension FruitCell: CodeViewProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(fruitImageView)
        contentView.addSubview(addButton)
        contentView.addSubview(removeButton)
    }
    func setupConstraints() {
        fruitImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(paddingView)
            make.centerY.equalToSuperview()
            make.width.equalTo(sizeImageView)
            make.height.equalTo(sizeImageView)
        }
        addButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(paddingView)
            make.bottom.equalToSuperview().inset(paddingView)
            make.top.equalToSuperview().offset(paddingView)
            make.width.equalTo(buttonHeight)
        }
        removeButton.snp.makeConstraints { make in
            make.right.equalTo(addButton.snp.left)
            make.bottom.equalTo(addButton.snp.bottom)
            make.top.equalTo(addButton.snp.top)
            make.width.equalTo(buttonHeight)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(paddingView)
            make.left.equalTo(fruitImageView.snp.right).offset(paddingView)
            make.right.equalTo(removeButton.snp.left)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.bottom.equalToSuperview().inset(paddingView)
        }
    }
    func setupConfiguration() {
        contentView.isUserInteractionEnabled = true
        fruitImageView.backgroundColor = .yellow
        fruitImageView.contentMode = .scaleAspectFill
        fruitImageView.layer.cornerRadius = CGFloat(sizeImageView/2)
        fruitImageView.clipsToBounds = true
        fruitImageView.layer.borderWidth = borderWidthImageView
        fruitImageView.layer.borderColor = UIColor.red.cgColor
        removeButton.setTitle("-", for: .normal)
        removeButton.backgroundColor = .red
        removeButton.addTarget(self, action: #selector(self.removeItem), for: .touchUpInside)
        addButton.setTitle("+", for: .normal)
        addButton.backgroundColor = .systemGreen
        addButton.isEnabled = true
        addButton.addTarget(self, action: #selector(self.addItem), for: .touchUpInside)
    }
}

// MARK: - FruitCellView
extension FruitCell: FruitCellView {
    func setData(model: FruitCellViewModel) {
        self.currentItem = model
        fruitImageView.setImageWithCache(url: model.imageURL)
        let quantityString = model.quantity > 0 ? "\(model.quantity ) x " : ""
        titleLabel.text = String.init(format: "%@%@", quantityString, model.title)
        priceLabel.text = model.priceString()
        removeButton.isEnabled =  model.quantity > 0
        removeButton.backgroundColor = removeButton.isEnabled ? .red : .lightGray
    }
}
