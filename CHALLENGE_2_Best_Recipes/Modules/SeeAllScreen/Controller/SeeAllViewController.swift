//
//  SeeAllViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/28/23.
//

import UIKit
import SnapKit

final class SeeAllViewController: UIViewController {
    
    //  MARK: - Properties
    
    private var cookData: [Recipe] = []
    
    //  MARK: - UI
    
    private lazy var trendingNowCollectoinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
//    private lazy var backButton: UIBarButtonItem = {
//        let button = UIBarButtonItem(
//            image: UIImage(named: "BackArrow"),
//            style: .done,
//            target: self,
//            action: #selector(backButtonTapped)
//        )
//        button.tintColor = .black
//        return button
//    }()
    
//    private lazy var moreButton: UIBarButtonItem = {
//        let button = UIBarButtonItem(
//            image: UIImage(named: "More"),
//            style: .plain,
//            target: self,
//            action: #selector(moreButtonTapped)
//        )
//        button.tintColor = .black
//        return button
//    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupNavigationBar()
        addViews()
        setDelegates()
        registerCells()
        setConstrains()
        fetchRandomRecipes()
    }
    
//    //MARK: - @objc Private Func
//    @objc private func backButtonTapped() {
//        //navigationController?.pushViewController(RecipeViewControllerScreen(), animated: true)
//    }
//    @objc private func moreButtonTapped() {
//        // Need Action
//    }
}

extension SeeAllViewController {
    
    private func setupNavigationBar() {
        title = "Trending Now"

        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [
            .font: UIFont(name: Theme.Fonts.semiBoldFont, size: 25) ?? UIFont.systemFont(ofSize: 25, weight: .bold),
            .foregroundColor: UIColor(named: "purpleText") ?? .black
        ]

//        navigationItem.leftBarButtonItem = backButton
//        navigationItem.rightBarButtonItem = moreButton
        navigationController?.navigationBar.standardAppearance = navigationAppearance

    }
    
    private func addViews() {
        view.addSubview(trendingNowCollectoinView)
    }
    
    private func setConstrains() {
        trendingNowCollectoinView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setDelegates() {
        trendingNowCollectoinView.dataSource = self
        trendingNowCollectoinView.delegate = self
    }
    
    private func registerCells() {
        trendingNowCollectoinView.register(SeeAllTrendingCell.self, forCellWithReuseIdentifier: Theme.trending)
    }
    
    private func fetchRandomRecipes() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            APIManager.shared.fetchRandomRecipes(numberOfRecipes: 3) { result in
                switch result {
                case .success(let cookData):
                    let recipesWithImages = cookData.recipes.filter { recipe in
                        
                        guard !recipe.image.isEmpty else { return false }
                        
                        guard !recipe.title.isEmpty,
                              !recipe.extendedIngredients.isEmpty,
                              recipe.readyInMinutes > 0 else {
                            return false
                        }
                        
                        return true
                    }
                    self?.cookData = recipesWithImages
                    DispatchQueue.main.async {
                        self?.trendingNowCollectoinView.reloadData()
                    }
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
}

extension SeeAllViewController: UICollectionViewDataSource {
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

extension SeeAllViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}
