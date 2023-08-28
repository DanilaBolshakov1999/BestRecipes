//
//  ImageCollectionViewCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 28.08.2023.
//

import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Element
    
    private let saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Override init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstrains()
        
    }
    
    //MARK: - Required init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Views
    private func setViews() {
        backgroundColor = .blue
        addSubview(saleImageView)
    }
    
    //MARK: - Configure Cell
    
    func configureCell(imageName: String) {
        saleImageView.image = UIImage(named: "")
    }
}

extension SaleCollectionViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            saleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            saleImageView.trailingAnchor.constraint (equalTo: trailingAnchor, constant: 0),
            saleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            saleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        ])
    }
}
