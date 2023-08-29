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
    
    private let trendingCellIdentifier = "trendingCellID"
    private var trendingNowCollectoinView: UICollectionView!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupCollectionView()
        setupNavigationBar()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        trendingNowCollectoinView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        trendingNowCollectoinView.register(SeeAllTrendingCell.self, forCellWithReuseIdentifier: trendingCellIdentifier)
        trendingNowCollectoinView.dataSource = self
        trendingNowCollectoinView.delegate = self
        trendingNowCollectoinView.backgroundColor = .white
        
        view.addSubview(trendingNowCollectoinView)
        trendingNowCollectoinView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        title = "Trending Now"
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 25, weight: .bold),
            .foregroundColor: UIColor(named: "purpleText") ?? .black
        ]
        
        let backButton = UIBarButtonItem(image: UIImage(named: "BackArrow"), style: .done, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "More"), style: .plain, target: self, action: #selector(moreButtonTapped))
        moreButton.tintColor = .black
        navigationItem.rightBarButtonItem = moreButton
        
        navigationController?.navigationBar.standardAppearance = navigationAppearance
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func moreButtonTapped() {
        // Need Action
    }
    
}

extension SeeAllViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellIdentifier, for: indexPath) as! SeeAllTrendingCell
        
        if let dishImage = UIImage(named: "dishOne") {
            cell.configureCollectionCell(with: dishImage, describtion: "How to make yam\n& vegetable sauce at home", ingredients: "9 Ingredients", cookingTime: "25 min", rating: "5,0")
        }
        
        return cell
    }
}

extension SeeAllViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}


