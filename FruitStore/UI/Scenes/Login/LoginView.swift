//
//  LoginView.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import UIKit

final class LoginView: UIView {
    // MARK: - Properties
    let margin = 15
    let buttonHeght = 50
    weak var delegate: LoginViewProtocol?
    // MARK: - UI
    lazy var gridContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .clear
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 2.0
        return view
    }()
    lazy var button: UIButton = FinishButton(title: "login-button-title".localized())
    lazy var textFieldUsername: UITextField = LoginTextField(placeholder: "login-placeholder-username".localized())
    lazy var textFieldPassword: UITextField = LoginTextField(placeholder: "login-placeholder-password".localized(), isSecureTextEntry: true)
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Button Actions
    @objc func handleLogin() {
        delegate?.didTapLoginButton()
    }
}
// MARK: - CodeViewProtocol
extension LoginView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(button)
        gridContainer.addArrangedSubview(textFieldUsername)
        gridContainer.addArrangedSubview(textFieldPassword)
        addSubview(gridContainer)
    }
    func setupConstraints() {
        button.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().inset(margin)
            make.bottom.equalToSuperview().inset(margin * 2)
            make.height.equalTo(buttonHeght)
        }
        gridContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().inset(margin)
            make.centerY.equalToSuperview()
        }
    }
    func setupConfiguration() {
        self.backgroundColor = .lightGray
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(self.handleLogin), for: .touchUpInside)
    }
}
