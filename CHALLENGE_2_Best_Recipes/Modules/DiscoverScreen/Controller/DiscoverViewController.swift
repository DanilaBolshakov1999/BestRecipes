//
//  DiscoverViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/30/23.
//

import UIKit
import SnapKit

final class DiscoverViewController: UIViewController {
    
    //MARK: - UI
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Saved recipes"
        titleLabel.font = UIFont(name: Theme.Fonts.boldFont, size: 24)
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    private lazy var savedDishesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    
}

extension DiscoverViewController {
    
    private func setUpUI() {
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        registerCells()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(savedDishesCollectionView)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-30)
            make.leading.equalToSuperview().inset(20)
        }
        
        savedDishesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func registerCells() {
        savedDishesCollectionView.register(SavedDishCollectionCell.self, forCellWithReuseIdentifier: Theme.savedDish)
    }
    
}

extension DiscoverViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let savedDishCell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.savedDish, for: indexPath) as? SavedDishCollectionCell else { return UICollectionViewCell() }
        
        if let img = UIImage(named: "dishOne") {
            savedDishCell.configure(with: img, title: "How to make sharwama at home", rating: "5,0")
        }
        
        
        return savedDishCell
    }
    
}

extension DiscoverViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 282)
    }
}
