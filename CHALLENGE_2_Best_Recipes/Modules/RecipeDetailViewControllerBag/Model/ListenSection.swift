//
//  ListenSection.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 27.08.2023.
//

import Foundation

//MARK: - Listen Section

enum ListenSection {
    case sales([ListenItem])
    case category([ListenItem])
    case example([ListenItem])
    
    var items: [ListenItem] {
        switch self {
        case .sales(let items),
             .category(let items),
             .example(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .sales(_):
            return "How to make Tasty Fish (point & Kill)"
        case .category(_):
            return "Instructions"
        case .example(_):
            return "Ingredients"
        }
    }
    
}
