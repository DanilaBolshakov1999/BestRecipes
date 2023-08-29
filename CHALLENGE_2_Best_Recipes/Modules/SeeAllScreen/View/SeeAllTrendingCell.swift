//
//  SeeAllTrendingCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/28/23.
//

import UIKit

class SeeAllTrendingCell: UICollectionViewCell {
    
    //  MARK: UI
    
    private let backGroundDishImage: UIImageView = {
        let backGroundDishImage = UIImageView()
        backGroundDishImage.contentMode = .scaleAspectFill
        backGroundDishImage.clipsToBounds = true
        backGroundDishImage.layer.cornerRadius = 10
        return backGroundDishImage
    }()
    
    private let ratingOfDishStack: UIStackView = {
        let ratingOfDishStack = UIStackView()
        ratingOfDishStack.distribution = .fillEqually
        ratingOfDishStack.axis = .horizontal
        ratingOfDishStack.spacing = 2
        return ratingOfDishStack
    }()
    
    private let starImageView: UIImageView = {
        let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
        starImageView.tintColor = .black
        starImageView.contentMode = .scaleAspectFit
        return starImageView
    }()
    
    private let markOfDishLabel: UILabel = {
        let markOfDishLabel = UILabel()
        markOfDishLabel.text = ""
        markOfDishLabel.textColor = .purpleText
        markOfDishLabel.font = .poppins20()
        markOfDishLabel.numberOfLines = 0
        markOfDishLabel.lineBreakMode = .byWordWrapping
        markOfDishLabel.textAlignment = .left
        return markOfDishLabel
    }()
    
    private let describtionOfDishLabel: UILabel = {
        let describtionOfDishLabel = UILabel()
        describtionOfDishLabel.text = ""
        describtionOfDishLabel.textColor = .purpleText
        describtionOfDishLabel.font = .poppins16()
        describtionOfDishLabel.numberOfLines = 0
        describtionOfDishLabel.lineBreakMode = .byWordWrapping
        describtionOfDishLabel.textAlignment = .left
        return describtionOfDishLabel
    }()
    
    private let timeAndIngredientsLabel: UILabel = {
        let timeAndIngredientsLabel = UILabel()
        timeAndIngredientsLabel.text = ""
        timeAndIngredientsLabel.textColor = .purpleText
        timeAndIngredientsLabel.font = .poppins16()
        timeAndIngredientsLabel.numberOfLines = 0
        timeAndIngredientsLabel.lineBreakMode = .byWordWrapping
        timeAndIngredientsLabel.textAlignment = .left
        return timeAndIngredientsLabel
    }()
    
    func configureCollectionCell(with image: UIImage, describtion: String, ingredients: String, cookingTime: String, rating: String) {
        backGroundDishImage.image = image
        describtionOfDishLabel.text = describtion
        timeAndIngredientsLabel.text = "\(ingredients) | \(cookingTime)"
        markOfDishLabel.text = rating
        ratingOfDishStack.addArrangedSubview(starImageView)
        ratingOfDishStack.addArrangedSubview(markOfDishLabel)
        
        self.setUpCell()
    }
    
    private func setUpCell() {
        
        addSubview(backGroundDishImage)
        backGroundDishImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(timeAndIngredientsLabel)
        timeAndIngredientsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
        }
        
        addSubview(describtionOfDishLabel)
        describtionOfDishLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalTo(timeAndIngredientsLabel).inset(25)
        }
        
        addSubview(ratingOfDishStack)
        ratingOfDishStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(27.5)
            make.width.equalTo(68)
        }
        applyBlurEffect(to: ratingOfDishStack)
        
    }
    
    private func applyBlurEffect(to view: UIView) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.cornerRadius = 5
        blurView.clipsToBounds = true
        view.insertSubview(blurView, at: 0)
        view.backgroundColor = .clear
    }
}
