//
//  RecipeCardModel.swift
//  Veganning
//
//  Created by 임소은 on 8/11/24.
//

import SwiftUI

struct RecipeCardModel: Identifiable {
    let id = UUID()
    var title: String
    var likes: Int
    var comments: Int
    var recipeImage : UIImage?
    var recipedetail : String
}
