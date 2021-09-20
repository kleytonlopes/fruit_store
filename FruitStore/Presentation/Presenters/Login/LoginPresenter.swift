//
//  LoginPresenter.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import UIKit

class LoginPresenter {
    // MARK: - Use Case
    private let authentication: Authentication
    // MARK: - UI Protocols
    private let alertView: AlertView
    private let sign: SignButton
    init(authentication: Authentication, alertView: AlertView, sign: SignButton) {
        self.authentication = authentication
        self.alertView = alertView
        self.sign = sign
    }
    // MARK: - Public Methods
    func login(viewModel: LoginRequest) {
        authentication.auth(authenticationModel: viewModel.toAuthenticationModel()) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure:
                self.alertView.showMessage(viewModel: AlertViewModel(title: "login-alert-view-error-title".localized(), message: "login-alert-view-error-message".localized()))
            case .success:
                self.sign.didSign()
            }
        }
    }
}
