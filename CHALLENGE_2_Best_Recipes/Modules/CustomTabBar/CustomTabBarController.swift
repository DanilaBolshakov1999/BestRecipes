//
//  CustomTabBarController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 02.09.2023.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    public lazy var middleButton: UIButton = {
        let button = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25,
                                            y: -20, width: 48, height: 48))
        let conf = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let image = UIImage(systemName: "plus", withConfiguration: conf)
        button.setImage(image?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        button.backgroundColor = .redButton
        button.layer.cornerRadius = (button.layer.frame.width / 2)
        button.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        setValue(CustomTabBar(frame: tabBar.frame), forKey: "tabBar")
        guard let tabBar = self.tabBar as? CustomTabBar else { return }
        
        tabBar.didTapButton = { [unowned self] in
            self.routeToCreateNewRecipe()
        }
        
        setupMiddleButton()
        removeTabbarItemsText()
    }
    
    func routeToCreateNewRecipe() {
        navigationController?.pushViewController(CreateRecipeViewController(), animated: true)
    }
    
    func setupMiddleButton() {
        self.tabBar.addSubview(middleButton)
        self.view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)
        
        let homeVC = HomeViewController()
        let favoriteVC = FavoriteViewController()
        let createVC = CreateRecipeViewController()
        let bellVC = BellViewController()
        let profileVC = ProfileViewController()
        
        homeVC.setTabBarImage(imageName: Theme.home, title: "Home")
        favoriteVC.setTabBarImage(imageName: Theme.favorite, title: "Favorites")
        bellVC.setTabBarImage(imageName: Theme.bell, title: "Bell")
        profileVC.setTabBarImage(imageName: Theme.profile, title: "Profile")
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        let favoriteNC = UINavigationController(rootViewController: favoriteVC)
        let createNC = UINavigationController(rootViewController: createVC)
        let bellNC = UINavigationController(rootViewController: bellVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        
        let tabBarList = [homeNC, favoriteNC, createNC, bellNC, profileNC]
        
        viewControllers = tabBarList
    }
    
    func removeTabbarItemsText() {
       if let items = tabBarController?.tabBar.items {
          for item in items {
             item.title = ""
              item.imageInsets = UIEdgeInsets(top: 6,
                                              left: 0,
                                              bottom: -6,
                                              right: 0)
          }
       }
    }
    
    
    
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
        print("MenuButton")
    }
}
