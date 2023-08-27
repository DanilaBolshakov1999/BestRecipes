//
//  MainTabBarController + Extension.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 27.08.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalTabBar()
        setTapBarAppearance()
    }
    
    //MARK: - General Tab Bar
    
    private func generalTabBar() {
        viewControllers = [
            /*
             generalVC(viewController: OnboardingFirstViewController(), title: "Home", image: UIImage(named: "navBarHome"),
             generalVC(viewController: OnboardingFirstViewController(), title: "Home", image: UIImage(named: "navBarHome"),
             generalVC(viewController: OnboardingFirstViewController(), title: "Home", image: UIImage(named: "navBarHome"),
             */
        ]
    }
    
    //MARK: - General View Controller
    
    private func generalVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTapBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 10
        
        let wight = tabBar.bounds.width - positionOnX * 2
        let hight = tabBar.bounds.width + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
    }
}
