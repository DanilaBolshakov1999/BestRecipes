//
//  RecipeDetailViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 28.08.2023.
//

import UIKit
import SnapKit

final class RecipeDetailViewController: UIViewController {
    
    private lazy var collectionView : UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .blue
        collectionView.bounces = true
        return collectionView
    }()
    
    //MARK: - Private Properties
    
    private let sections = MockData.shared.pageData
    
    //MARK: - Life

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstrains()
    }
    
    //MARK: - SetViews
    
    private func setViews() {
        view.addSubview(collectionView)
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: Theme.popular)
        collectionView.register(InstructionsCollectionViewCell.self, forCellWithReuseIdentifier: Theme.instructions)
        collectionView.register(IngredientsCollectionViewCell.self, forCellWithReuseIdentifier: Theme.ingredients)
    }
    
    //MARK: - Set Delegate
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDelegate

extension RecipeDetailViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDelegate

extension RecipeDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .sales(let sale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.popular,
                                                                for: indexPath) as? SaleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: sale[indexPath.row].image)
            return cell
            
        case .category(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.instructions,
                                                                for: indexPath) as? InstructionsCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(categoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)
            return cell
            
        case .example(let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.ingredients,
                                                                for: indexPath) as? IngredientsCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: example[indexPath.row].image)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "header",
                for: indexPath)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}


//MARK: - Set Constrains

extension RecipeDetailViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
