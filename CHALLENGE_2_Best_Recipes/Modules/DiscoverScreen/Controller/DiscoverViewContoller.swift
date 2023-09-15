//
//  DiscoverViewContoller.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 9/2/23.
//

import UIKit
import SnapKit

final class DiscoverViewContoller: UIViewController {
    
    private var recipes: [SavedRecipesModel] = []
    
    //MARK: - UI
    
    private lazy var savedDishesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(named: "BackArrow"),
            style: .done,
            target: self,
            action: #selector(backButtonTapped)
        )
        button.tintColor = .black
        return button
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRecentRecipes()
    }
    
    //  MARK: - Set UI
    
    private func setUpUI() {
        setNavigationbar()
        addSubviews()
        setDelegates()
        setConstraints()
        registerCells()
    }
    
    //  MARK: - Private @objc func
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DiscoverViewContoller {
    
    private func setNavigationbar() {
        title = "Saved Recipes"
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [
            .font: UIFont(name: Theme.Fonts.semiBoldFont, size: 25) ?? UIFont.systemFont(ofSize: 25, weight: .bold),
            .foregroundColor: UIColor(named: "purpleText") ?? .black
        ]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.standardAppearance = navigationAppearance
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func addSubviews() {
        view.addSubview(savedDishesCollectionView)
    }
    
    private func setDelegates() {
        savedDishesCollectionView.dataSource = self
        savedDishesCollectionView.delegate = self
    }
    
    private func setConstraints() {
        savedDishesCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func registerCells() {
        savedDishesCollectionView.register(SavedDishCollectionCell.self, forCellWithReuseIdentifier: Theme.savedDish)
    }
    
    private func fetchRecentRecipes() {
        recipes = SavedRecipes.shared.savedRecipes
        savedDishesCollectionView.reloadData()
    }
}

extension DiscoverViewContoller: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let savedDishCell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.savedDish, for: indexPath) as? SavedDishCollectionCell else { return UICollectionViewCell() }
        
        savedDishCell.delegate = self
        
        APIManager.shared.fetchRecipeImage(id: recipes[indexPath.row].id) { fetchedImage in
            if let image = fetchedImage {
                savedDishCell.configure(at: indexPath.row, with: image, title: self.recipes[indexPath.row].title, rating: self.recipes[indexPath.row].rating)
            }
        }
        
        return savedDishCell
    }
    
}

extension DiscoverViewContoller: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 282)
    }
    
}

extension DiscoverViewContoller: SavedDishCollectionCellDelegate {
    func didTapSaveButton(at index: Int) {
        recipes.remove(at: index)
        SavedRecipes.shared.removeRecipe(at: index)
        savedDishesCollectionView.reloadData()
    }
}
