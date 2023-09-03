//
//  CreateRecipeViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 03.09.2023.
//

import UIKit

class CreateRecipeViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "underConstructionImage")
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setSonstraints()
        
        if let tabBarItem = self.tabBarController?.tabBar.items?[2] as? UITabBarItem {
            tabBarItem.title = .none
            tabBarItem.isEnabled = false
        }
    }
}

extension CreateRecipeViewController {
    private func setSonstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            imageView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}

extension CreateRecipeViewController {
    private func setViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Create Recipe"
        view.backgroundColor = .darkGray
        view.addSubview(imageView)
    }
}
