//
//  InstructionsCollectionViewCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 28.08.2023.
//

import UIKit

class InstructionsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage (named: "recipeDetailImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel ()
        label.text = "Category"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setViews() {
        addSubview(categoryImageView)
        addSubview(categoryLabel)
        
        
    }
    
    //MARK: - Configure Cell
    
    func configureCell(categoryName: String, imageName: String) {
        categoryLabel.text = categoryName
        categoryImageView.image = UIImage (named: imageName)
    }
}

extension InstructionsCollectionViewCell {
     func setConstrains() {
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint (equalTo: trailingAnchor, constant: -5),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant:16),
            
            categoryImageView.topAnchor.constraint (equalTo: topAnchor, constant: 5),
            categoryImageView.leadingAnchor.constraint(equalTo:leadingAnchor,constant:5),
            categoryImageView.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -5),
            categoryImageView.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: 0)
        ])
    }
}
