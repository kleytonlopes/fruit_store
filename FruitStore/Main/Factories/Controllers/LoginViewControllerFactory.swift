//
//  LoginViewController.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation

func makeLoginController(authentication: Authentication) -> LoginViewController {
    let controller = LoginViewController()
    let presenter = LoginPresenter(authentication: authentication, alertView: WeakVarProxy(controller), sign: WeakVarProxy(controller))
    controller.loginRequest = presenter.login
    return controller
}
