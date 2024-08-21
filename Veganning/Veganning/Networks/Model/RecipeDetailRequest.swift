//
//  RecipeDetailRequest.swift
//  Veganning
//
//  Created by 임소은 on 8/21/24.
//

import Foundation

struct RecipeDetailRequest: Codable {
    let status: Int
    let success: Bool
    let data: String
    let image: String
    let name: String
    let ingredient : Array<String>
    
}

