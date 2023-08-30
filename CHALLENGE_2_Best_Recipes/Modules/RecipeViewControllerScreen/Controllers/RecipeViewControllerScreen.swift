//
//  RecipeViewControllerScreen.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 29.08.2023.
//

import UIKit
import SnapKit

final class RecipeViewControllerScreen: UIViewController {
    
    //MARK: - UI + Extension
    
    private var labelHeaderOne = UILabel(title: "Instructions", backgroundColor: .blue)
    private var labelHeaderTwo = UILabel(title: "Instructions", backgroundColor: .blue)

    //MARK: - UI

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Theme.videoScreen)
        return image
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .blue
        textView.text = Theme.textViewText
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.isScrollEnabled = false
        textView.backgroundColor = .brown
        return textView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 500)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavController()
        setViews()
        setConstrains()
        view.backgroundColor = .cyan
        
        //MARK: - Scroll View

    }
    
    //MARK: - @objc private func
    
    @objc private func backButtonTapped() {
        navigationController?.pushViewController(SeeAllViewController(), animated: true)
    }
    
    @objc private func buttonTapped() {
        navigationController?.pushViewController(SeeAllViewController(), animated: true)
    }
    }

    extension RecipeViewControllerScreen {
        
        //MARK: - Configure Nav Controller
        
        private func configureNavController() {
            
            title = "Description of the dish"
            
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
                NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .black
            ]
            
            let appearanceTwo = UINavigationBarAppearance()
            appearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
                NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .black
            ]
            
            let leftBarButtonItem = UIBarButtonItem(
                image: UIImage(named: Theme.backSwipe),
                style: .done, target: self,
                action: #selector(backButtonTapped)
            )
            
            let rightBarButtonItem = UIBarButtonItem(
                image: UIImage(named: Theme.moreSwipe),
                style: .done, target: self,
                action: #selector(buttonTapped)
            )
            
            leftBarButtonItem.tintColor = .black
            rightBarButtonItem.tintColor = .black
            
            navigationItem.leftBarButtonItem = leftBarButtonItem
            navigationController?.navigationBar.standardAppearance = appearance
            navigationItem.rightBarButtonItem = rightBarButtonItem
            navigationController?.navigationBar.standardAppearance = appearanceTwo
        }
    
    //MARK: - Set Views
    
    private func setViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(labelHeaderOne)
        scrollView.addSubview(textView)
        scrollView.addSubview(labelHeaderTwo)
    }
    
    //MARK: - Set Constrains
    
    private func setConstrains() {
        
       
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        labelHeaderOne.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(imageView).inset(-20)
        }
        
        textView.snp.makeConstraints { make in
            make.bottom.equalTo(imageView).inset(-350)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        labelHeaderTwo.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(textView).inset(-20)
        }
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
    }
}
