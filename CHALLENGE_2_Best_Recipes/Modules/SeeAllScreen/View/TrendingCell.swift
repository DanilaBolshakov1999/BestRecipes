//
//  TrendingCell.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/28/23.
//

import UIKit

class TrendingCell: UICollectionViewCell {
    
    let backGroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        
        backGroundImage.image = UIImage(named: "your_background_image_name_here")
        backGroundImage.contentMode = .scaleAspectFill
        backGroundImage.clipsToBounds = true
        
        // Add the image view to the cell's content view
        addSubview(backGroundImage)
        backGroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    
}
