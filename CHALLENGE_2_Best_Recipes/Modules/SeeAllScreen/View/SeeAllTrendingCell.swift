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
        return UILabel(textColor: .purpleText ?? .white, font: UIFont(name: Theme.Fonts.appFont, size: 20) ?? .systemFont(ofSize: 20))
    }()
    
    private let describtionOfDishLabel: UILabel = {
        return UILabel(textColor: .purpleText ?? .white, font: UIFont(name: Theme.Fonts.extraBoldFont, size: 16) ?? .systemFont(ofSize: 16))
    }()
    
    private let timeAndIngredientsLabel: UILabel = {
        return UILabel(textColor: .purpleText ?? .white, font: UIFont(name: Theme.Fonts.appFont, size: 16) ?? .systemFont(ofSize: 16))
    }()
    
    func configureCollectionCell(with image: UIImage, describtion: String, ingredients: String, cookingTime: Int, rating: Double) {
        let formattedRating = String(format: "%.1f", rating).replacingOccurrences(of: ".", with: ",")
        backGroundDishImage.image = image
        describtionOfDishLabel.text = "How to make yam\n& \(describtion)"
        timeAndIngredientsLabel.text = "\(ingredients) | \(cookingTime)"
        markOfDishLabel.text = formattedRating
        ratingOfDishStack.addArrangedSubview(starImageView)
        ratingOfDishStack.addArrangedSubview(markOfDishLabel)
        
        setUpCell()
    }
    
}

extension SeeAllTrendingCell {
    
    private func setUpCell() {
        addCellSubViews()
        setCellConstrains()
    }
    
    private func addCellSubViews() {
        addSubview(backGroundDishImage)
        addSubview(timeAndIngredientsLabel)
        addSubview(describtionOfDishLabel)
        addSubview(ratingOfDishStack)
    }
    
    private func setCellConstrains() {
        backGroundDishImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        timeAndIngredientsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
        }
        
        describtionOfDishLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalTo(timeAndIngredientsLabel).inset(25)
        }
        
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