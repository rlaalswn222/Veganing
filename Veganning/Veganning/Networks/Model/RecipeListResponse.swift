//
//  RecipeListResponse.swift
//  Veganning
//
//  Created by 김민솔 on 8/21/24.
//

import Foundation

struct RecipeListResponse: Codable {
    let id: Int
    let name: String
    let image: String
    let step_number_1: Int
    let description_1: String
    let step_number_2: Int
    let description_2: String
}
