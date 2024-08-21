//
//  RecipeReviewResponse.swift
//  Veganning
//
//  Created by 임소은 on 8/22/24.
//

import Foundation

struct RecipeReviewResponse : Codable {
    
    let reviews : [reviews]
    
    
}

struct reviews : Codable {
    let id : Int
    let body : String
    let created_at : String
    let rating : Int
    let image : String
    let user_id : Int
    let recipe_id : Int
    let user_name : String
}
