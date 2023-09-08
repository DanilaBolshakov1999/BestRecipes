//
//  HomeViewControllerRecentRecipe.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by VASILY IKONNIKOV on 30.08.2023.
//

import UIKit

class HomeViewControllerRecentRecipeCell: UICollectionViewCell {
	private let recentImage: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "recentImage")
		imageView.image = image
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 16
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Kelewele Ghanian Recipe"
		label.font = UIFont(name: Theme.Fonts.boldFont, size: 14)
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		addSubviews()
		setupConstraints()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recentImage.image = nil
        titleLabel.text = nil
    }
	
    func configure(imageName: UIImage, title: String) {
		recentImage.image = imageName
        titleLabel.text = DisplayData.shared.truncateTitle(title)
	}
}

// MARK: - Style and Constraints
extension HomeViewControllerRecentRecipeCell {
	private func setupView() {
		clipsToBounds = true
		layer.cornerRadius = 16
	}
	
	private func addSubviews() {
		addSubview(recentImage)
		addSubview(titleLabel)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			recentImage.heightAnchor.constraint(equalToConstant: 124),
			recentImage.widthAnchor.constraint(equalToConstant: 124),
			recentImage.centerXAnchor.constraint(equalTo: centerXAnchor),
			recentImage.topAnchor.constraint(equalTo: topAnchor),
			
			titleLabel.topAnchor.constraint(equalTo: recentImage.bottomAnchor, constant: -5),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
