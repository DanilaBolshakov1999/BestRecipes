//
//  RecipeModel.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 9/7/23.
//

import Foundation

struct CookData: Codable {
    let recipes: [Recipe]
}

// MARK: - Recipe

struct Recipe: Codable {
    let preparationMinutes: Int
    let cookingMinutes: Int
    let aggregateLikes: Int
    let healthScore: Int
    let creditsText: String
    let sourceName: String
    let pricePerServing: Double
    let extendedIngredients: [ExtendedIngredient]
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let summary: String
    let cuisines: [String]
    let dishTypes: [String]
    //let ingredients: [Ingredients]
    
    enum CodingKeys: String, CodingKey {
        case preparationMinutes,
             cookingMinutes,
             aggregateLikes,
             healthScore,
             creditsText,
             sourceName,
             pricePerServing,
             extendedIngredients,
             id,
             title,
             readyInMinutes,
             servings,
             summary,
             cuisines,
             dishTypes
             //ingredients
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        preparationMinutes = try container.decode(Int.self, forKey: .preparationMinutes)
        cookingMinutes = try container.decode(Int.self, forKey: .cookingMinutes)
        aggregateLikes = try container.decode(Int.self, forKey: .aggregateLikes)
        healthScore = try container.decode(Int.self, forKey: .healthScore)
        creditsText = try container.decode(String.self, forKey: .creditsText)
        sourceName = try container.decode(String.self, forKey: .sourceName)
        pricePerServing = try container.decode(Double.self, forKey: .pricePerServing)
        extendedIngredients = try container.decode([ExtendedIngredient].self, forKey: .extendedIngredients)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        readyInMinutes = try container.decode(Int.self, forKey: .readyInMinutes)
        servings = try container.decode(Int.self, forKey: .servings)
//      sourceUrl = try container.decode(String.self, forKey: .sourceUrl)
//      image = try container.decode(String.self, forKey: .image)
//      imageType = try container.decode(String.self, forKey: .imageType)
        summary = try container.decode(String.self, forKey: .summary)
        cuisines = try container.decode([String].self, forKey: .cuisines)
        dishTypes = try container.decode([String].self, forKey: .dishTypes)
//      ingredients = try container.decode([Ingredients].self, forKey: .ingredients)
    }
}

// MARK: - ExtendedIngredient

struct ExtendedIngredient: Codable {
    let id: Int
}

//struct Ingredients: Codable {
//    let id: Int
//    let title: String
//    let image: String
//    let imageType: String
//    let usedIngredientCount: Int
//    let missedIngredientCount: Int
//    let missedIngredients: [MissedIngredients]
//    let usedIngredients: [UsedIngredients]
//    let unusedIngredients: [UnusedIngredients]
//    let likes: Int
//}
//
//struct MissedIngredients: Codable {
//    let id: Int
//    let amount: Int
//    let unit: String
//    let unitLong: String
//    let unitShort: String
//    let aisle: String
//    let name: String
//    let original: String
//    let originalName: String
//    let meta: [String]
//    let image: String
//}
//
//struct UsedIngredients: Codable {
//    let id: Int
//    let amount: Int
//    let unit: String
//    let unitLong: String
//    let unitShort: String
//    let aisle: String
//    let name: String
//    let original: String
//    let originalName: String
//    let meta: [String]
//    let image: String
//}
//
//struct UnusedIngredients: Codable {
//    let id: Int
//    let amount: Int
//    let unit: String
//    let unitLong: String
//    let unitShort: String
//    let aisle: String
//    let name: String
//    let original: String
//    let originalName: String
//    let meta: [String]
//    let image: String
//}
