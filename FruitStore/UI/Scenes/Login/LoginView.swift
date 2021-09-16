//
//  LoginView.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import UIKit

final class LoginView: UIView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var gridContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .clear
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 2.0
        return view
    }()
    
    lazy var button: UIButton = FinishButton(title: "Login")
    
    lazy var textFieldUsername: UITextField = LoginTextField(placeholder: "entre o username")
    
    lazy var textFieldPassword: UITextField = LoginTextField(placeholder: "entre com a senha", isSecureTextEntry: true)
    
    @objc func handleLogin(){
        print("Clicou")
    }
}

extension LoginView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(button)
        gridContainer.addArrangedSubview(textFieldUsername)
        gridContainer.addArrangedSubview(textFieldPassword)
        addSubview(gridContainer)
    }
    
    func setupConstraints() {
        button.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
        gridContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupConfiguration() {
        self.backgroundColor = .lightGray
        button.addTarget(self, action:#selector(self.handleLogin), for: .touchUpInside)
    }
    
    
}
