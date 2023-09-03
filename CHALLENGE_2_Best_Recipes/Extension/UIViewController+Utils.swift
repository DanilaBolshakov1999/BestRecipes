//
//  UIViewController+Utils.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 27.08.2023.
//

import UIKit

extension UIViewController {
    
//    func setStatusBar() {
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithTransparentBackground()
//        navBarAppearance.backgroundColor = UIColor.white
//        navBarAppearance.titleTextAttributes = [
//            NSAttributedString.Key.font: UIFont(name: Theme.Fonts.boldFont, size: 24)!,
//            NSAttributedString.Key.foregroundColor: UIColor.black
//        ]

//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .default)
        let image = UIImage(named: imageName, in: nil, with: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
