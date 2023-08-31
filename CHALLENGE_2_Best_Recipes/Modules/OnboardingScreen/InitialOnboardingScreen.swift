//
//  InitialOnboardingScreen.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Alexander Altman on 29.08.2023.
//

import UIKit

final class InitialOnboardingScreen: UIViewController {
    
    //MARK: Elements
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Theme.Fonts.semiBoldFont, size: 16)
        label.text = "★ 100k+ Premium recipes"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomLabelBig: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Theme.Fonts.boldFont, size: 56)
        label.text = """
Best
Recipe
"""
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomLabelSmall: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Theme.Fonts.appFont, size: 18)
        label.text = "Find best recipes for cooking"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

   private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
       button.layer.backgroundColor = UIColor.redButton?.cgColor
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.Fonts.semiBoldFont, size: 16)
       button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var backImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "initialOBBackground")
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
 
    //MARK: - Private Methods
    @objc private func goNext() {
        print("tap-tap")
        let vc = OnboardingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension InitialOnboardingScreen {
    //MARK: - View Set Up
    private func setViews() {
        view.addSubview(backImageView)
        view.addSubview(topLabel)
        view.addSubview(bottomLabelBig)
        view.addSubview(bottomLabelSmall)
        view.addSubview(continueButton)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 23),
            
            bottomLabelBig.bottomAnchor.constraint(equalTo: bottomLabelSmall.topAnchor, constant: -15),
            bottomLabelBig.heightAnchor.constraint(equalToConstant: 160),
            bottomLabelBig.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            bottomLabelBig.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            bottomLabelSmall.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -32),
            bottomLabelSmall.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            continueButton.heightAnchor.constraint(equalToConstant: 65),
            continueButton.widthAnchor.constraint(equalToConstant: 170),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
