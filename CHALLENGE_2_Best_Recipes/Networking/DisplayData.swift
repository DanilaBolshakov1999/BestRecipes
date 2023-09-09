//
//  DisplayData.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 9/8/23.
//

import Foundation

final class DisplayData {
    static let shared = DisplayData()
    
    private init() {}
    
    func calculateRating(rating: Int) -> Double {
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
    
    func truncateTitle(_ title: String) -> String {
        let excludedWords = ["must", "at", "with", "-", "and", "&"]
        let words = title.components(separatedBy: " ")
        
        var truncatedWords: [String] = []
        
        for word in words {
            if truncatedWords.count >= 3 {
                break
            }
            if !excludedWords.contains(word.lowercased()) {
                truncatedWords.append(word)
            }
        }
        
        return truncatedWords.joined(separator: " ")
    }
    
}
