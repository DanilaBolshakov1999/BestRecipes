//
//  SeeAllTrendingCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/28/23.
//

import UIKit

final class SeeAllTrendingCell: UICollectionViewCell {
    
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
    
    override func prepareForReuse() {
        backGroundDishImage.image = nil
        describtionOfDishLabel.text = nil
        timeAndIngredientsLabel.text = nil
        markOfDishLabel.text = nil
    }
    
    func configureCollectionCell(with image: UIImage, describtion: String, ingredients: String, cookingTime: Int, rating: Int) {
        let formattedRating = String(format: "%.1f", rating)
        backGroundDishImage.image = image
        describtionOfDishLabel.text = "How to make yam\n& \(describtion)"
        timeAndIngredientsLabel.text = "\(ingredients) Ingredients | \(cookingTime) min"
        markOfDishLabel.text = String(describing: calculateRating(rating: rating))
        ratingOfDishStack.addArrangedSubview(starImageView)
        ratingOfDishStack.addArrangedSubview(markOfDishLabel)
        
        setUpCell()
    }
    
    func configureSearchCollectionCell(with image: UIImage, title: String) {

        backGroundDishImage.image = image
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
    
    private func calculateRating(rating: Int) -> Double {
        var calculatedRating = 0.0
        
        switch rating {
        case 0...10:
            calculatedRating = 2.0
        case 10...15:
            calculatedRating = 2.2
        case 15...20:
            calculatedRating = 2.3
        case 20...23:
            calculatedRating = 2.5
        case 23...25:
            calculatedRating = 2.7
        case 25...35:
            calculatedRating = 3.0
        case 35...40:
            calculatedRating = 3.3
        case 40...45:
            calculatedRating = 3.4
        case 45...50:
            calculatedRating = 3.5
        case 50...60:
            calculatedRating = 4.0
        case 60...65:
            calculatedRating = 4.2
        case 65...70:
            calculatedRating = 4.4
        case 70...75:
            calculatedRating = 4.5
        case 75...80:
            calculatedRating = 4.6
        case 80...85:
            calculatedRating = 4.7
        case 85...90:
            calculatedRating = 4.8
        case 90...100:
            calculatedRating = 5.0
        default:
            calculatedRating = 5.0
        }
        
        return calculatedRating
    }
}
