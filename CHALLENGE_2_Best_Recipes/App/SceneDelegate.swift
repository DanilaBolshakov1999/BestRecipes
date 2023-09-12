//
//  SceneDelegate.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Danila Bolshakov on 26.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowSene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowSene)
        let welcomeVC = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = welcomeVC
        window?.makeKeyAndVisible()
    }
}

