//
//  RecipeCardModel.swift
//  Veganning
//
//  Created by 임소은 on 8/11/24.
//

import SwiftUI


struct RecipeCardModel: Identifiable {
    let id : Int
    var name: String
    let image: String
    let step_number_1: Int
    let description_1: String
    let step_number_2: Int
    let description_2: String
}
