//
//  ProfileViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 27.08.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
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
    }
}

extension ProfileViewController {
    private func setSonstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            imageView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}

extension ProfileViewController {
    private func setViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Profile"
        view.backgroundColor = .brown
        view.addSubview(imageView)
    }
}
