//
//  UILabel + Extention.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 30.08.2023.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(title: String, backgroundColor: UIColor?) {
        self.init()
        self.text = title
        self.backgroundColor = backgroundColor
    }
}
