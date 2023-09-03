//
//  RecipeCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 31.08.2023.
//

import Foundation
import UIKit

class RecipeCell: UITableViewCell {
    
    let cellImage = UIImageView()
    let nameItem = UILabel()
    let weightItem = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cellImage)
        addSubview(nameItem)
        addSubview(weightItem)
        
        cellImage.frame = CGRect(x: 40, y: 15, width: 50, height: 50)
        nameItem.frame = CGRect(x: 120, y: 15, width: 120, height: 30)
        weightItem.frame = CGRect(x: 250, y: 15, width: 120, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
