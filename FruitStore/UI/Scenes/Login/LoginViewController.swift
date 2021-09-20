//
//  LoginViewController.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    let loginView = LoginView()
    var loginRequest: ((LoginRequest) -> Void)?
    var didSignSuccessfully: (() -> Void)?

    // MARK: - View Life Cycle
    override func loadView() {
        self.view = loginView
        setup()
    }
    func setup() {
        self.title = "login-view-title".localized()
        loginView.delegate = self
        hideKeyboardOnTap()
    }

}
// MARK: - LoginViewProtocol
extension LoginViewController: LoginViewProtocol {
    func didTapLoginButton() {
        let viewModel = LoginRequest(email: loginView.textFieldUsername.text, password: loginView.textFieldPassword.text)
        loginRequest?(viewModel)
    }
}
// MARK: - AlertViewProtocol
extension LoginViewController: AlertView {
    func showMessage(viewModel: AlertViewModel) {
        let alert = UIAlertController.confirmation(title: viewModel.title, message: viewModel.message)
        present(alert, animated: true)
    }
}
// MARK: - SignProtocol
extension LoginViewController: SignButton {
    func didSign() {
        didSignSuccessfully?()
    }
}
