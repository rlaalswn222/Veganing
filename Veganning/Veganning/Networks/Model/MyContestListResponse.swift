//
//  MyContestListResponse.swift
//  Veganning
//
//  Created by 임소은 on 8/22/24.
//

import Foundation

struct MyContestListResponse: Codable {
    let id :Int
    let name : String
    let description : String
    let image :String
    let type : String
    let carbohydrate : Int
    let calorie : Int
    let protein : Int
    let fat : Int
    let average_rating : Int
    let ingredients: [Ingredients]
    let cookingSteps: [CookingStep]
}



