//
//  RecipePreviewResponses.swift
//  Veganning
//
//  Created by 임소은 on 8/22/24.
//

import Foundation

struct RecipePreviewResponse : Codable {
    let status : Int
    let success : Bool
    let message : String
    let data : String
}
