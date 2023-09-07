//
//  SeeAllViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/28/23.
//

import UIKit
import SnapKit

final class SeeAllViewController: UIViewController {
    
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
//        title = "Trending Now"

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
}

extension SeeAllViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let trendingCell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.trending, for: indexPath) as? SeeAllTrendingCell else { return UICollectionViewCell() }
        
        if let dishImage = UIImage(named: "dishOne") {
            trendingCell.configureCollectionCell(with: dishImage, describtion: "vegetable sauce at home", ingredients: "9 Ingredients", cookingTime: 25, rating: 5.0)
        }
        return trendingCell
    }
}

extension SeeAllViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}
