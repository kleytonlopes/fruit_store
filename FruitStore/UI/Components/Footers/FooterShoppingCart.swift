//
//  FooterShoppingCart.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 19/09/21.
//

import UIKit

class FooterShoppingCart: UIView {
    // MARK: - Properties
    lazy var totalLabel: UILabel = UILabel()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Public
    func setTotal(value: Float) {
        totalLabel.text = String.init(format: "shopping-cart-view-total".localized(), value)
    }
}
// MARK: - CodeViewProtocol
extension FooterShoppingCart: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(totalLabel)
    }
    func setupConstraints() {
        totalLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(15)
        }
        totalLabel.backgroundColor = .yellow
    }
    func setupConfiguration() {
        self.backgroundColor = .lightGray
        totalLabel.backgroundColor = .clear
        totalLabel.textAlignment = .right
        totalLabel.text = "Aguarde, carregando"
    }
}
