//
//  RecipeViewControllerScreen.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 29.08.2023.
//

import UIKit
import SnapKit

final class RecipeViewControllerScreen: UIViewController {
    
    //MARK: - UI
    
     var playButton: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.layer.cornerRadius = 35
        button.setTitle("Запустить", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavController()
        setViews()
        setConstrains()
        view.backgroundColor = .cyan
        playButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func buttonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: SetViews
    
    private func setViews() {
        view.addSubview(playButton)
    }
    
    //MARK:  Set Constrains
    
    private func setConstrains() {
        playButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension RecipeViewControllerScreen {
    
    private func configureNavController() {
        
        title = "Description of the dish"
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .black
        ]

        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "backSwipe"),
            style: .done, target: self,
            action: #selector(backButtonTapped)
        )

        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "dishOne"),
            style: .done, target: self,
            action: #selector(buttonTapped)
        )

        leftBarButtonItem.tintColor = .black
        rightBarButtonItem.tintColor = .black

        navigationItem.leftBarButtonItem = rightBarButtonItem
        navigationController?.navigationBar.standardAppearance = appearance
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationController?.navigationBar.standardAppearance = appearance

           }
    }
