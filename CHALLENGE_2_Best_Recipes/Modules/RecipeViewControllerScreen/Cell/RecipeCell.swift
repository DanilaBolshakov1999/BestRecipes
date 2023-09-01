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
        
        cellImage.frame = CGRect(x: 10, y: 40, width: 70, height: 70)
        nameItem.frame = CGRect(x: 120, y: 60, width: 120, height: 30)
        weightItem.frame = CGRect(x: 300, y: 60, width: 120, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
