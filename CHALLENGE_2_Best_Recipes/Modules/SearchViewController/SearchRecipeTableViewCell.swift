//
//  SearchRecipeTableViewCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Danila Bolshakov on 12.09.2023.
//

import UIKit
import Kingfisher

class SearchRecipeTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "SearchRecipeTableViewCell"
    
    //MARK: - UI
    
    private lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var recipeName: UILabel = {
        let label = UILabel(text: "How to sharwama at home", textColor: .black, font: .boldSystemFont(ofSize: 24))
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -  override init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    //MARK: - required init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    public func configure(image: String, title: String) {
        guard let urlString = URL(string: image) else { return }
        recipeImage.kf.setImage(with: urlString)
        recipeName.text = title
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        
        addSubview(recipeImage)
        addSubview(recipeName)
        
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: topAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recipeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            recipeImage.heightAnchor.constraint(equalToConstant: 200),
            
            recipeName.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 10),
            recipeName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            recipeName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
    }
}
