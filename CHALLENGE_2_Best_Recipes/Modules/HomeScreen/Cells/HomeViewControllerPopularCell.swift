//
//  HomeViewControllerPopularCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by VASILY IKONNIKOV on 30.08.2023.
//

import UIKit

class HomeViewControllerPopularCell: UICollectionViewCell {
	
	private let popularImage: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "popularImage")
		imageView.image = image
		imageView.layer.cornerRadius = 110/2
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private let view: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(named: Theme.neutral10)
		view.clipsToBounds = true
		view.layer.cornerRadius = 16
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Chicken and Vegetable wrap"
		label.numberOfLines = 0
		label.textAlignment = .center
		label.font = UIFont(name: Theme.Fonts.boldFont, size: 14)
		return label
	}()
	
	private let titleTimeLabel: UILabel = {
		let label = UILabel()
		label.text = "Time"
		label.textColor = UIColor(named: Theme.neutral30)
		label.font = UIFont(name: Theme.Fonts.appFont, size: 12) //.systemFont(ofSize: 12, weight: .light)
		return label
	}()
	
	private let timeLabel: UILabel = {
		let label = UILabel()
		label.text = "5 Mins"
		label.font = UIFont(name: Theme.Fonts.boldFont, size: 12)//.systemFont(ofSize: 12, weight: .bold)
		return label
	}()
	
	private let bookmarkButton: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(named: "InactiveBookmark"), for: .normal)
		button.backgroundColor = .white
		button.layer.cornerRadius = 24/2
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	lazy var mainStackView: UIStackView =  {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.spacing = 10
		stackView.contentMode = .scaleAspectFit
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var timeStackView: UIStackView =  {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.spacing = 3
		stackView.contentMode = .left
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var bottomStackView: UIStackView =  {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .fillProportionally
		stackView.spacing = 5
		stackView.contentMode = .scaleAspectFill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
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
	
	func configure(imageName: String, title: String, time: String) {
		popularImage.image = UIImage(named: imageName)
		titleLabel.text = title
		timeLabel.text = "\(time) Mins"
	}
	
	func getTitle() -> String {
		return titleLabel.text ?? ""
	}
	
	func getImage() -> UIImage {
		return popularImage.image ?? UIImage.init(systemName: "hourglass")!
	}
}

// MARK: - Style and Constraints
extension HomeViewControllerPopularCell {
	private func setupView() {
		clipsToBounds = true
		layer.cornerRadius = 16
	}
	
	private func addSubviews() {
		addSubview(view)
		addSubview(popularImage)
		addSubview(mainStackView)
		mainStackView.addArrangedSubview(titleLabel)
		mainStackView.addArrangedSubview(timeStackView)
		timeStackView.addArrangedSubview(titleTimeLabel)
		timeStackView.addArrangedSubview(bottomStackView)
		bottomStackView.addArrangedSubview(timeLabel)
		bottomStackView.addArrangedSubview(bookmarkButton)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			popularImage.topAnchor.constraint(equalTo: topAnchor),
			popularImage.widthAnchor.constraint(equalToConstant: 110),
			popularImage.heightAnchor.constraint(equalToConstant: 110),
			popularImage.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			view.topAnchor.constraint(equalTo: topAnchor, constant: 55),
			view.leadingAnchor.constraint(equalTo: leadingAnchor),
			view.trailingAnchor.constraint(equalTo: trailingAnchor),
			view.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			mainStackView.topAnchor.constraint(equalTo: popularImage.bottomAnchor, constant: 10),
			mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
			
			bookmarkButton.heightAnchor.constraint(equalToConstant: 24),
			bookmarkButton.widthAnchor.constraint(equalToConstant: 24)
		])
	}
}
