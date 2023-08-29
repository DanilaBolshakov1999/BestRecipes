//
//  File.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 29.08.2023.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(titleColor: UIColor?, backgroundColor: UIColor? = .clear, cornerRadius: CGFloat) {
        self.init(type: .system)
        self.titleLabel?.font =  .systemFont(ofSize: 25)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
}
