//
//  SearchViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 09.09.2023.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    
    //  MARK: - Properties
    
    private var cookData: [Recipe] = []
    
    //  MARK: - UI
    
    private lazy var trendingCollectoinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        fetchRecipes()
        setupNavigationBar()
        addViews()
        setDelegates()
        registerCells()
        setConstrains()
    }
    
//    //MARK: - @objc Private Func
//    @objc private func backButtonTapped() {
//        //navigationController?.pushViewController(RecipeViewControllerScreen(), animated: true)
//    }
//    @objc private func moreButtonTapped() {
//        // Need Action
//    }
}

extension SearchViewController {
    
    private func setupNavigationBar() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [
            .font: UIFont(name: Theme.Fonts.semiBoldFont, size: 25) ?? UIFont.systemFont(ofSize: 25, weight: .bold),
            .foregroundColor: UIColor(named: "purpleText") ?? .black
        ]
        navigationController?.navigationBar.standardAppearance = navigationAppearance

    }
    
    private func addViews() {
        view.addSubview(trendingCollectoinView)
    }
    
    private func setConstrains() {
        trendingCollectoinView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setDelegates() {
        trendingCollectoinView.dataSource = self
        trendingCollectoinView.delegate = self
    }
    
    private func registerCells() {
        trendingCollectoinView.register(SeeAllTrendingCell.self, forCellWithReuseIdentifier: Theme.trending)
    }
    
    private func fetchRecipes() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            APIManager.shared.fetchRandomRecipes(numberOfRecipes: 2) { result in
                switch result {
                case .success(let data):
                    let recipesWithImages = data.recipes.filter { recipe in
                        guard !recipe.title.isEmpty,
                              !recipe.extendedIngredients.isEmpty,
                              recipe.readyInMinutes > 0 else {
                            return false
                        }
                        
                        return true
                    }
                    self?.cookData = recipesWithImages
                    DispatchQueue.main.async {
                        self?.trendingCollectoinView.reloadData()
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
        print(cookData)
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cookData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let trendingCell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.trending, for: indexPath) as? SeeAllTrendingCell else { return UICollectionViewCell() }
        
        let recipe = cookData[indexPath.item]
        
        DispatchQueue.global(qos: .userInitiated).async {
            APIManager.shared.fetchRecipeImage(id: recipe.id) { image in
                if let image = image {
                    trendingCell.configureCollectionCell(
                        with: image,
                        describtion: recipe.title,
                        ingredients: String(describing: recipe.extendedIngredients.count),
                        cookingTime: recipe.readyInMinutes,
                        rating: recipe.healthScore
                    )
                }
            }
        }
        return trendingCell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}
