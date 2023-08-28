//
//  SeeAllViewController.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/28/23.
//

import UIKit
import SnapKit

final class SeeAllViewController: UIViewController {
    
    private let data = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    private let trendingCellID = "trendingCellID"
    
    //  MARK: - UI Elements
    
    private var collectionView: UICollectionView!
    
    // MARK: - LifeCycle Methods
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
    }
    
    //  MARK: - Configure UI
    
    
    private func setUpView() {
        
        let fontDescriptor = UIFontDescriptor(name: "Poppins", size: 24).withSymbolicTraits(.traitBold)!
        let customFont = UIFont(descriptor: fontDescriptor, size: 24)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: customFont]
        self.title = "Trending Now"
        
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    
    
}

// MARK: - UICollectionViewDataSource

extension SeeAllViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellID, for: indexPath) as! TrendingCell
        
        cell.backGroundImage.image = UIImage(systemName: "heart.fill")
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SeeAllViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: view.frame.height / 3)
    }
}








