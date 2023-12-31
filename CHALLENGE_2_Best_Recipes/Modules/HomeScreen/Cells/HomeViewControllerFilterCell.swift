//
//  HomeViewControllerFilterCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by VASILY IKONNIKOV on 30.08.2023.
//

import UIKit

class HomeViewControllerFilterCell: UICollectionViewCell {
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.text = "Breakfast"
		label.textColor = UIColor(named: Theme.primary20)
		label.font = UIFont(name: Theme.Fonts.boldFont, size: 12) //.systemFont(ofSize: 12)
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
	
	func configure(title: String) {
		titleLabel.text = title
	}
	
	func getTitle() -> String {
		titleLabel.text ?? ""
	}
	
	func configureCellSelect() {
		titleLabel.textColor = UIColor(named: Theme.whiteColor)
		backgroundColor = UIColor(named: Theme.primary50)
	}
	
	func configureCellDeselect() {
		titleLabel.textColor = UIColor(named: Theme.primary20)
		backgroundColor = UIColor(named: Theme.whiteColor)
	}
	
}

// MARK: - Style and Constraints
extension HomeViewControllerFilterCell {
	private func setupView() {
		clipsToBounds = true
		layer.cornerRadius = 10
	}
	
	private func addSubviews() {
		addSubview(titleLabel)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
