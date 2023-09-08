//
//  HomeViewControllerTrendingCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by VASILY IKONNIKOV on 30.08.2023.
//

import UIKit

final class HomeViewControllerTrendingCell: UICollectionViewCell {
	
	private let trendingImage: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "trendingImage")
		imageView.image = image
		imageView.layer.cornerRadius = 16
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "How to sharwama at home"
		label.font = UIFont(name: Theme.Fonts.boldFont, size: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private let rating: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(red: 48/256, green: 48/256, blue: 48/256, alpha: 0.3)
		view.clipsToBounds = true
		view.layer.cornerRadius = 10
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private let ratingImage: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "star")
		imageView.image = image
		return imageView
	}()
	
	private let ratingLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = UIFont(name: Theme.Fonts.boldFont, size: 14)
		label.text = "4,5"
		
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private let stackView: UIStackView =  {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .center
		stackView.distribution = .fillProportionally
		stackView.spacing = 5
		stackView.contentMode = .scaleToFill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	private let bookmarkButton: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(named: "InactiveBookmark"), for: .normal)
		button.backgroundColor = .white
		button.layer.cornerRadius = 32/2
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		addSubviews()
		setupConstraints()
		
		bookmarkButton.addTarget(self, action: #selector(bookmarkAction), for: .touchUpInside)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureCell(title: String, imageName: String) {
		trendingImage.image = UIImage(named: imageName)
		titleLabel.text = title
	}
	
	func getTitle() -> String {
		return titleLabel.text ?? ""
	}
	
	func getImage() -> UIImage {
		return trendingImage.image ?? UIImage.init(systemName: "hourglass")!
	}
	
	@objc private func bookmarkAction(_ sender: UIButton) {
		print("BookMark")
	}
	
}

// MARK: - Style and Constraints
extension HomeViewControllerTrendingCell {
	private func setupView() {
		clipsToBounds = true
		layer.cornerRadius = 16
	}
	
	private func addSubviews() {
		addSubview(trendingImage)
		addSubview(bookmarkButton)
		addSubview(titleLabel)
		trendingImage.addSubview(rating)
		rating.addSubview(stackView)
		stackView.addArrangedSubview(ratingImage)
		stackView.addArrangedSubview(ratingLabel)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			trendingImage.topAnchor.constraint(equalTo: topAnchor),
			trendingImage.leadingAnchor.constraint(equalTo: leadingAnchor),
			trendingImage.trailingAnchor.constraint(equalTo: trailingAnchor),
			trendingImage.heightAnchor.constraint(equalToConstant: 180),
			
			titleLabel.topAnchor.constraint(equalTo: trendingImage.bottomAnchor, constant: 10),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
			
			bookmarkButton.topAnchor.constraint(equalTo: trendingImage.topAnchor, constant: 10),
			bookmarkButton.trailingAnchor.constraint(equalTo: trendingImage.trailingAnchor, constant: -10),
			bookmarkButton.heightAnchor.constraint(equalToConstant: 32),
			bookmarkButton.widthAnchor.constraint(equalToConstant: 32),
			
			rating.topAnchor.constraint(equalTo: trendingImage.topAnchor, constant: 10),
			rating.leadingAnchor.constraint(equalTo: trendingImage.leadingAnchor, constant: 10),
			rating.widthAnchor.constraint(equalToConstant: 58),
			rating.heightAnchor.constraint(equalToConstant: 28),

			stackView.centerXAnchor.constraint(equalTo: rating.centerXAnchor),
			stackView.centerYAnchor.constraint(equalTo: rating.centerYAnchor)
		])
	}
}
