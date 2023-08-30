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
        titleLabel.font = UIFont(name: Theme.Fonts.extraBoldFont, size: 36)
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
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(savedDishesCollectionView)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalToSuperview().inset(20)
        }
        
        savedDishesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

extension DiscoverViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let savedDishCell = collectionView.dequeueReusableCell(withReuseIdentifier: Theme.savedDish, for: indexPath) as? SavedDishCollectionCell else { return UICollectionViewCell() }
        
        
        return savedDishCell
    }
    
}

extension DiscoverViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}
