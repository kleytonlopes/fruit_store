//
//  LoginViewController.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

func makeLoginController(authentication: Authentication) -> LoginViewController {
    let controller = LoginViewController()
    let presenter = LoginPresenter(authentication: authentication, alertView: controller, sign: controller)
    controller.loginRequest = presenter.login
    return controller
}
