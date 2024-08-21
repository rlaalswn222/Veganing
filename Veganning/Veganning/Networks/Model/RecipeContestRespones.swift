//
//  RecipeContestRespones.swift
//  Veganning
//
//  Created by 임소은 on 8/21/24.
//

import Foundation

struct RecipeContestRespones: Codable {
    let name : String
    let description : String
    let image : String
    let type : String
    let carbohydrate : Int
    let calorie : Int
    let protein : Int
    let fat : Int
    let ingredients : Array<String>
    let cookingStep : Array<String>

    
    
}
