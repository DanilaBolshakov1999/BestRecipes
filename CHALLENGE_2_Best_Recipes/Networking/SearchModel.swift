//
//  SearchModel.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 09.09.2023.
//

import Foundation

struct RecipeSearch: Codable {
    let results: [RecipeOne]
}

struct RecipeOne: Codable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}
