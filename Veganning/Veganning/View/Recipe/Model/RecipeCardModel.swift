//
//  RecipeCardModel.swift
//  Veganning
//
//  Created by 김민솔 on 8/11/24.
//

import Foundation

struct RecipeCardModel: Identifiable {
    let id = UUID()
    var title: String
    var likes: Int
    var comments: Int
}
