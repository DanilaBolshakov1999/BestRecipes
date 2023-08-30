//
//  TrendingCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/28/23.
//

import UIKit

class TrendingCell: UICollectionViewCell {
    
    private let backGroundImage: UIImageView = {
        let img = UIImageView()
        
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        
        return img
    }()
    
    private let ratingStack: UIStackView = {
        let stck = UIStackView()
        
        stck.distribution = .fillEqually
        stck.axis = .horizontal
        stck.spacing = 2
        
        return stck
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let ratingMarkLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.text = ""
        lbl.textColor = .purpleText
        
        lbl.font = .poppins20()
        
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        
        
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.text = ""
        lbl.textColor = .purpleText
        
        lbl.font = .poppins16()
        
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        
        
        return lbl
    }()
    
    private let cookingTimeAndIngredientsLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.text = ""
        lbl.textColor = .purpleText
        
        lbl.font = .poppins16()
        
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        
        
        return lbl
    }()
    
    
    public func configure(with image: UIImage, describtion: String, ingredients: String, cookingTime: String, rating: String) {
        
        backGroundImage.image = image
        descriptionLabel.text = describtion
        cookingTimeAndIngredientsLabel.text = "\(ingredients) | \(cookingTime)"
        ratingMarkLabel.text = rating
        
        ratingStack.addArrangedSubview(starImageView)
        ratingStack.addArrangedSubview(ratingMarkLabel)
        
        self.setUpCell()
    }
    
    private func setUpCell() {
        
        
        addSubview(backGroundImage)
        backGroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(cookingTimeAndIngredientsLabel)
        cookingTimeAndIngredientsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalTo(cookingTimeAndIngredientsLabel).inset(25)
        }
        
        addSubview(ratingStack)
        ratingStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(27.5)
            make.width.equalTo(62)
        }
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = ratingStack.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        blurView.layer.cornerRadius = 5
        blurView.clipsToBounds = true
        
        ratingStack.insertSubview(blurView, at: 0)
        ratingStack.backgroundColor = .clear
        
        
    }
    
    
}
