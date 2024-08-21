//
//  RecipeSavingResponse.swift
//  Veganning
//
//  Created by 임소은 on 8/22/24.
//

import Foundation

struct RecipeSavingResponse: Codable{
    let message : String
    let newSaving : [newSaving]
}

struct newSaving: Codable {
    let id : Int
    let user_id : Int
    let recipe_id : Int

}
