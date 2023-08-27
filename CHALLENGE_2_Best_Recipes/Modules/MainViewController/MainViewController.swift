//
//  MainViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 27.08.2023.
//

import UIKit

final class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
}

extension MainViewController {
    private func setupViews() {
        let homeVC = HomeViewController()
        let favoriteVC = FavoriteViewController()
        let bellVC = BellViewController()
        let profileVC = ProfileViewController()

        homeVC.setTabBarImage(imageName: Theme.home, title: "Home")
        favoriteVC.setTabBarImage(imageName: Theme.favorite, title: "Favorites")
        bellVC.setTabBarImage(imageName: Theme.bell, title: "Bell")
        profileVC.setTabBarImage(imageName: Theme.profile, title: "Profile")

        let homeNC = UINavigationController(rootViewController: homeVC)
        let favoriteNC = UINavigationController(rootViewController: favoriteVC)
        let bellNC = UINavigationController(rootViewController: bellVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        
        let tabBarList = [homeNC, favoriteNC, bellNC, profileNC]

        viewControllers = tabBarList
        
        setStatusBar()
    }

    private func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.clipsToBounds = true
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .gray
        tabBar.isTranslucent = false
    }
}


