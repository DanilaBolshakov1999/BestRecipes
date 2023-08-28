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
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        return collectionView
    }()
    
    //MARK: - Private Properties
    
    private let sections = MockData.shared.pageData
    
    //MARK: - Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstrains()
        setDelegate()
    }
    
    //MARK: - SetViews
    
    private func setViews() {
        view.backgroundColor = .white
        title = "FoodShop"
        view.addSubview(collectionView)
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: Theme.popular)
        collectionView.register(InstructionsCollectionViewCell.self, forCellWithReuseIdentifier: Theme.instructions)
        collectionView.register(IngredientsCollectionViewCell.self, forCellWithReuseIdentifier: Theme.ingredients)
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Theme.header)
        collectionView.collectionViewLayout = createLayout()
    }
    
    //MARK: - Set Delegate
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - Create Layout

        private func createLayout() -> UICollectionViewCompositionalLayout {
            UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
                guard let self = self else { return nil }
                let section = self.sections[sectionIndex]
    
                switch section {
                case .sales(_):
                    return self.createSaleSection()
                case .category(_):
                    return self.createCategorySection()
                case .example(_):
                    return self.categoryExampleSection()
                }
            }
        }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                               behaviour: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                               interGroupSpacing: CGFloat,
                               supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                               contentInsets: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behaviour
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }

    private func createSaleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .fractionalHeight(0.2)), subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behaviour: .groupPaging,
                                          interGroupSpacing: 5,
                                          supplementaryItems: [],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: -10, bottom: 0, trailing: 0)
        return section
    }
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.1)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behaviour: .none,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func categoryExampleSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.9),
                                                            heightDimension: .fractionalHeight(0.45)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.1)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behaviour: .continuous,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 0)
        return section
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
                                                                        withReuseIdentifier: Theme.header,
                                                                        for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}

//MARK: - Set Constrains

extension RecipeDetailViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
