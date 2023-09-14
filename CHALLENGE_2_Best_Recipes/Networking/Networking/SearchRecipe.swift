//
//  SearchRecipe.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 12.09.2023.
//

import Foundation

struct SearchRecipe: Codable {
    var results: [InformationSearchRecipe]
}

struct InformationSearchRecipe: Codable {
    var id: Int
    var title: String
    var image: String
}
