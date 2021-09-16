//
//  SceneDelegate.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = LoginViewController()
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }

}

