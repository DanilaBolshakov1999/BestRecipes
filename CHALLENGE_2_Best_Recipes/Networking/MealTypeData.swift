//
//  MealTypeModel.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by VASILY IKONNIKOV on 09.09.2023.
//

import Foundation

struct TypeData: Codable {
	let results: [Resulte]
}

struct Resulte: Codable {
	let cookingMinutes: Int
	let id: Int
	let title: String
	let readyInMinutes: Int //, servings: Int
	let analyzedInstructions: [AnalyzedInstruction]

	enum CodingKeys: String, CodingKey {
		case cookingMinutes, id, title, readyInMinutes, analyzedInstructions
	}
}

// MARK: - AnalyzedInstruction
struct AnalyzedInstruction: Codable {
	let name: String
	let steps: [Step]
}

// MARK: - Step
struct Step: Codable {
	let number: Int
	let step: String
	let ingredients, equipment: [Ent]
//	let length: Length?
}

// MARK: - Ent
struct Ent: Codable {
	let id: Int
	let name, localizedName, image: String
//	let temperature: Length?
}
