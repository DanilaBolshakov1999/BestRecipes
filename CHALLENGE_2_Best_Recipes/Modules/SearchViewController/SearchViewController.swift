//
//  SearchViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Danila Bolshakov on 09.09.2023.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    
    
    //  MARK: - Properties
    
    private var cookData: [RecipeOne] = []
    private let searchController = UISearchController(searchResultsController: nil)
    
    //  MARK: - UI
    
    private lazy var trendingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .brown
        return collectionView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        searchConfig()
        fetchRecipes()
        setupNavigationBar()
        addViews()
        setDelegates()
        registerCells()
        setConstrains()
    }
}

extension SearchViewController {
    
    private func setupNavigationBar() {
        title = "Quick Search"

        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [
            .font: UIFont(name: Theme.Fonts.semiBoldFont, size: 25) ?? UIFont.systemFont(ofSize: 25, weight: .bold),
            .foregroundColor: UIColor(named: "purpleText") ?? .black
        ]
        navigationController?.navigationBar.standardAppearance = navigationAppearance

    }
    
    private func searchConfig() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func addViews() {
        view.addSubview(trendingCollectionView)
    }
    
    private func setConstrains() {
        trendingCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setDelegates() {
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
    }
    
    private func registerCells() {
        trendingCollectionView.register(SeeAllTrendingCell.self, forCellWithReuseIdentifier: Theme.trending)
    }
    
    private func fetchRecipes() {
            APIManager.shared.fetchRecipesSearch(ingredients: "pasta", numberOfRecipes: 2) { result in
                switch result {
                case .success(let cook):
                    let recipesImages = cook.results
                    self.cookData = recipesImages
                    DispatchQueue.main.async {
                        self.trendingCollectionView.reloadData()
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}

//MARK: - UI Collection View Data Source

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cookData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let trendingCell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.trending, for: indexPath) as? SeeAllTrendingCell else { return UICollectionViewCell() }
        
        let recipe = cookData[indexPath.item]
        
//        DispatchQueue.global(qos: .userInitiated).async {
//            APIManager.shared.fetchRecipeImage(id: recipe.id) { image in
//                if let image = image {
//                    trendingCell.configureCollectionCell(
//                        with: image,
//                        describtion: recipe.title,
//                        ingredients: String(describing: recipe.extendedIngredients.count),
//                        cookingTime: recipe.readyInMinutes,
//                        rating: recipe.healthScore
//                    )
//                }
//            }
//        }
        return trendingCell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 400)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("Hello")
    }
}
