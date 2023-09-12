//
//  Model.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by Danila Bolshakov on 01.09.2023.
//

import Foundation

//MARK: - Struct Model

struct CellItems {
    let image: String
    let nameItem: String
    let weightItem: String
}

let items = [
    CellItems(image: "ingredientsFirst", nameItem: "Fish", weightItem: "200g"),
    CellItems(image: "ingredientsSecond", nameItem: "Ginger", weightItem: "100g"),
    CellItems(image: "sunflowerOilThird", nameItem: "Vegetable Oli", weightItem: "80g"),
    CellItems(image: "ingredientsFourth", nameItem: "Salt", weightItem: "50g"),
    CellItems(image: "sunflowerOilThird", nameItem: "Cucumber", weightItem: "200g")
]
