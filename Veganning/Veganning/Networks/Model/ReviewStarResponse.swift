//
//  ReviewStarResponse.swift
//  Veganning
//
//  Created by 임소은 on 8/22/24.
//

import Foundation

struct ReviewStarResponse : Codable{
    
    let rate : [rate]
    
    
}
struct rate: Codable {
    let recipe_id : Int
    let average_rating : Double
    let total_reviews : Int
    let one_star_count: Int
    let two_star_count: Int
    let three_star_count: Int
    let four_star_count: Int
    let five_star_count: Int
}

