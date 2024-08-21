//
//  RecipeContestRequest.swift
//  Veganning
//
//  Created by 김민솔 on 8/21/24.
//

import Foundation

struct RecipeContestRequest: Codable {
    let name: String
    let description: String
    let image: String
    let type: String
    let carbohydrate: Double
    let sugar: Double
    let protein: Double
    let fat: Double
    let ingredients: [Ingredients]
    let cookingSteps: [CookingStep]
}

struct Ingredients: Codable {
    let name: String
    let quantity: String
}

struct CookingStep: Codable {
    let stepNumber: Int
    let description: String
    let image: String
}
