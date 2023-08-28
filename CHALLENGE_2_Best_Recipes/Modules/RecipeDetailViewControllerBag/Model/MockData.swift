//
//  MockData.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 27.08.2023.
//

import Foundation

//MARK: - Mock Data

struct MockData {
    
    static let shared = MockData()
    
    private let sales: ListenSection = {
        .sales([.init(title: "How to make Tasty Fish (point & Kill)", image: Theme.fishRecipeDetail)])
    }()
    
    private let category: ListenSection = {
        .category([.init(title: "Fish", image: Theme.fishRecipeDetail),
                   .init(title: "Ginger", image: Theme.fishRecipeDetail),
                   .init(title: "VegetableOil", image: Theme.fishRecipeDetail),
                   .init(title: "Salt", image: Theme.fishRecipeDetail)])
    }()
    
    private let example: ListenSection = {
        .example([
            .init(title: "Fish", image: Theme.fishRecipeDetail),
            .init(title: "Ginger", image: Theme.fishRecipeDetail),
            .init(title: "VegetableOil", image: Theme.fishRecipeDetail),
            .init(title: "Salt", image: Theme.fishRecipeDetail)])
    }()
    
    var pageData: [ListenSection] {
        [sales, category, example]
    }
}
