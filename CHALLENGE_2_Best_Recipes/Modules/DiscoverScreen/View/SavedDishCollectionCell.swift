//
//  SavedDishCollectionCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/30/23.
//

import UIKit

class SavedDishCollectionCell: UICollectionViewCell {
    
    private let dishImage: UIImageView = {
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
        
        imageView.tintColor = .purpleText
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let ratingMarkLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.text = ""
        lbl.textColor = .purpleText
        
        lbl.font = UIFont(name: "Poppins", size: 20)
        
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    private let saveButton: UIButton = {
        let btn = UIButton(type: .system)
        
        btn.backgroundColor = .white
        btn.layer.cornerRadius = btn.frame.height / 2
        btn.clipsToBounds = true
        
        let image = UIImage(named: "Favorites")
        btn.setImage(image, for: .normal)
        btn.tintColor = .gray
        
        return btn
    }()
    
    private let dishTitle: UILabel = {
        let lbl = UILabel()
        
        lbl.font = UIFont(name: "Poppins", size: 20)
        lbl.textColor = .purpleText
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = .purpleText
        
        return lbl
    }()
    
    public func configure(with image: UIImage, title: String, rating: String) {
        dishImage.image = image
        dishTitle.text = title
        ratingMarkLabel.text = rating
        
        ratingStack.addArrangedSubview(starImageView)
        ratingStack.addArrangedSubview(ratingMarkLabel)
        
        setUpCell()
    }
    
    private func setUpCell() {
        addSubview(dishImage)
        dishImage.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = ratingStack.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.cornerRadius = 5
        blurView.clipsToBounds = true
        
        ratingStack.insertSubview(blurView, at: 0)
        ratingStack.backgroundColor = .clear
        
        addSubview(ratingStack)
        ratingStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(27.5)
            make.width.equalTo(70)
        }
        
        addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        saveButton.layoutIfNeeded()
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
        
        addSubview(dishTitle)
        dishTitle.snp.makeConstraints { make in
            make.top.equalTo(dishImage.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
    }
}
