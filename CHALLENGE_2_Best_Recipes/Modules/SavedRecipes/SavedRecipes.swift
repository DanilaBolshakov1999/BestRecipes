//
//  SavedRecipes.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Ислам Пулатов on 9/14/23.
//

import UIKit

class SavedRecipes {
    static let shared = SavedRecipes()
    
    private init() {}
    
    var savedRecipes: [SavedRecipesModel] {
        get {
            if let data = UserDefaults.standard.data(forKey: "savedRecipes"),
               let recipes = try? JSONDecoder().decode([SavedRecipesModel].self, from: data) {
                return recipes
            } else {
                return []
            }
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: "savedRecipes")
            }
        }
    }
    
    func addRecipe(_ recipe: SavedRecipesModel) {
        var currentRecipes = savedRecipes
        currentRecipes.append(recipe)
        savedRecipes = currentRecipes
    }
    
    func removeRecipe(at index: Int) {
        var currentRecipes = savedRecipes
        currentRecipes.remove(at: index)
        savedRecipes = currentRecipes
    }
}
