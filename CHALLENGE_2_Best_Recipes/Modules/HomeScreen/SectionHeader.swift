//
//  SectionHeader.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by VASILY IKONNIKOV on 30.08.2023.
//

import UIKit

final class SectionHeader: UICollectionReusableView {
	
	static let reuseId = "SectionHeader"
	private let title: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: Theme.Fonts.extraBoldFont, size: 20)
		return label
	}()
	
	private lazy var seeAllButton: UIButton = {
		let button = UIButton()
		button.setTitle("See all ", for: .normal)
		button.titleLabel?.font = UIFont(name: Theme.Fonts.boldFont, size: 14)
		button.setImage(UIImage.init(systemName: "arrow.right"), for: .normal)
		button.tintColor = UIColor(named: Theme.neutral100)
		button.semanticContentAttribute = .forceRightToLeft
		let titleButtonColor = UIColor(named: Theme.primary50)
		button.setTitleColor(titleButtonColor, for: .normal)
		button.isHidden = true
//        button.isUserInteractionEnabled = false
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(title)
		addSubview(seeAllButton)
		setupConstraints()
		
		seeAllButton.addTarget(self, action: #selector(seeAllAction), for: .touchUpInside)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(titleText: String, hideButton: Bool) {
		title.text = titleText
		seeAllButton.isHidden = hideButton
	}
	
	@objc func seeAllAction(_ sender: UIButton) {
		print(title.text)
	}
}

// MARK: - Constraints
extension SectionHeader {
	private func setupConstraints() {
		title.translatesAutoresizingMaskIntoConstraints = false
		seeAllButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: topAnchor),
			title.bottomAnchor.constraint(equalTo: bottomAnchor),
			title.leadingAnchor.constraint(equalTo: leadingAnchor),
			title.trailingAnchor.constraint(equalTo: seeAllButton.leadingAnchor, constant: -10),
			
			seeAllButton.topAnchor.constraint(equalTo: topAnchor),
			seeAllButton.bottomAnchor.constraint(equalTo: bottomAnchor),
			seeAllButton.widthAnchor.constraint(equalToConstant: 100),
			seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}
