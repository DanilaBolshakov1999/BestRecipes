//
//  SavedDishCollectionCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 9/2/23.
//

import UIKit

protocol SavedDishCollectionCellDelegate: AnyObject {
    func didTapSaveButton(at index: Int)
}


final class SavedDishCollectionCell: UICollectionViewCell {
    
    weak var delegate: SavedDishCollectionCellDelegate?
    
    private var recipePostion: Int = 0
    
    //  MARK: - UI
    
    private let dishBackGroundImage: UIImageView = {
        let dishBackGroundImage = UIImageView()
        dishBackGroundImage.contentMode = .scaleAspectFill
        dishBackGroundImage.clipsToBounds = true
        dishBackGroundImage.layer.cornerRadius = 10
        return dishBackGroundImage
    }()
    
    private let ratingView: UIView = {
        let ratingView = UIView()
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.backgroundColor = .clear
        ratingView.addSubview(blurView)
        ratingView.layer.cornerRadius = 8
        ratingView.clipsToBounds = true
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return ratingView
    }()
    
    private let starImageView: UIImageView = {
        let starImageView = UIImageView(image: UIImage(named: Theme.star))
        starImageView.tintColor = .black
        starImageView.contentMode = .scaleAspectFit
        return starImageView
    }()
    
    private let ratingMarkLabel: UILabel = {
        let ratingMarkLabel = UILabel()
        ratingMarkLabel.text = ""
        ratingMarkLabel.textColor = .purpleText
        ratingMarkLabel.font = UIFont(name: "Poppins", size: 20)
        ratingMarkLabel.numberOfLines = 0
        ratingMarkLabel.lineBreakMode = .byWordWrapping
        ratingMarkLabel.textAlignment = .left
        return ratingMarkLabel
    }()
    
    private let saveButton: UIButton = {
        let saveButton = UIButton(type: .system)
        saveButton.backgroundColor = .white
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
        saveButton.clipsToBounds = true
        let image = UIImage(named: Theme.favoritesActive)
        saveButton.setBackgroundImage(image, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return saveButton
    }()
    
    private let dishTitle: UILabel = {
        let dishTitle = UILabel()
        dishTitle.font = UIFont(name: Theme.Fonts.appFont, size: 16)
        dishTitle.textColor = .purpleText
        dishTitle.numberOfLines = 0
        dishTitle.lineBreakMode = .byWordWrapping
        dishTitle.textColor = .black
        return dishTitle
    }()
    
    private lazy var moreButton: UIButton = { [weak self] in
        guard let self = self else {
            fatalError("Self is nil in moreButton SavedDishCollectionCell")
        }
        
        let moreButton = UIButton(type: .system)
        moreButton.setImage(UIImage(named: Theme.moreSwipe), for: .normal)
        moreButton.tintColor = .black
        moreButton.addTarget(self, action: #selector(self.moreButtonTapped), for: .touchUpInside)
        return moreButton
    }()
    
    
    func configure(at position: Int, with image: UIImage, title: String, rating: String) {
        recipePostion = position
        dishBackGroundImage.image = image
        dishTitle.text = title
        ratingMarkLabel.text = rating
        
        setUpCell()
    }
    
    //  MARK: - @objc private Func
    
    @objc private func saveButtonTapped() {
        delegate?.didTapSaveButton(at: recipePostion)
    }
    
    @objc private func moreButtonTapped() {
        print("moreButtonTapped taped")
    }
    
}

extension SavedDishCollectionCell {
    
    private func setUpCell() {
        addCellSubViews()
        setUpConstrains()
    }
    
    private func addCellSubViews() {
        addSubview(dishBackGroundImage)
        addSubview(ratingView)
        addSubview(saveButton)
        addSubview(dishTitle)
        addSubview(moreButton)
        
        ratingView.addSubview(starImageView)
        ratingView.addSubview(ratingMarkLabel)
    }
    
    private func setUpConstrains() {
        dishBackGroundImage.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(27.5)
            make.width.equalTo(70)
        }
        
        starImageView.snp.makeConstraints { make in
            make.width.equalTo(16)
            make.height.equalTo(16)
            make.leading.equalToSuperview().offset(10)
            make.top.bottom.equalToSuperview()
        }
        
        ratingMarkLabel.snp.makeConstraints { make in
            make.leading.equalTo(starImageView.snp.trailing).offset(5)
            make.centerY.equalTo(starImageView.snp.centerY)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        saveButton.layoutIfNeeded()
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
        
        dishTitle.snp.makeConstraints { make in
            make.top.equalTo(dishBackGroundImage.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(5)
        }
        
        moreButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(5)
            make.centerY.equalTo(dishTitle.snp.centerY)
        }
    }
    
}
