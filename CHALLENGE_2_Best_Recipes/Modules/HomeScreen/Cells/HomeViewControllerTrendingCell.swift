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
	
    func configureCell(title: String, imageName: UIImage, rating: Int) {
		trendingImage.image = imageName
		titleLabel.text = "How to \(truncateTitle(title))"
        ratingLabel.text = String(describing: calculateRating(rating: rating))
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
    
    private func truncateTitle(_ title: String) -> String {
        let excludedWords = ["must", "at", "with", "-", "and"]
        let words = title.components(separatedBy: " ")
        
        var truncatedWords: [String] = []
        
        for word in words {
            if truncatedWords.count >= 2 {
                break
            }
            if !excludedWords.contains(word.lowercased()) {
                truncatedWords.append(word)
            }
        }
        
        return truncatedWords.joined(separator: " ")
    }

    
}
