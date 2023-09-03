//
//  UIStack + Extension.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 31.08.2023.
//

import Foundation
import UIKit

extension UIStackView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        //self.backgroundColor = .blue
        self.axis = .vertical
        self.spacing = 10
    }
}

extension UIStackView {
    convenience init(ingredient: UIColor) {
        self.init()
        self.backgroundColor = ingredient
        self.axis = .horizontal
        self.spacing = 10
    }
}
