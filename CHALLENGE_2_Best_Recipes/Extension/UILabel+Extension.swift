//
//  UILabel+Extension.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 8/30/23.
//

import UIKit


extension UILabel {
    
    convenience init(text: String = "", textColor: UIColor, font: UIFont, numberOfLines: Int = 0, lineBreakMode: NSLineBreakMode = .byWordWrapping, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
        self.textAlignment = textAlignment
    }
    
    convenience init(title: String, backgroundColor: UIColor?) {
        self.init()
        self.text = title
        self.backgroundColor = backgroundColor
        self.font = UIFont(name: Theme.Fonts.boldFont, size: 24)
    }
}


