//
//  SceneDelegate.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let fruitListFactory: () -> FruitListViewController = {
        let localDatabaseAdapter = makeDatabaseAdapter()
        let localDatabase = makeLocalDatabase(database: localDatabaseAdapter)
        return makeFruitListController(getFruitsArray: localDatabase)
    }
    private let loginFactory: () -> LoginViewController = {
        let localLoginAdapter = makeLoginValidatorAdapter()
        let localAuthentication = makeLocalAuthentication(localValidator: localLoginAdapter)
        let loginViewController = makeLoginController(authentication: localAuthentication)
        return loginViewController
    }
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let nav = NavigationController()
        let loginRouter = LoginRouterImplementation(nav: nav, fruitListFactory: fruitListFactory)
        let loginViewController = loginFactory()
//        let fruitsViewController = fruitListFactory()
        nav.setRootViewController(loginViewController)
        loginViewController.didSignSuccessfully = loginRouter.goToFruitList
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
    }

}
