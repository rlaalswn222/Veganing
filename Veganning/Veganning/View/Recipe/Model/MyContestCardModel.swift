//
//  RecipeCardModel.swift
//  Veganning
//
//  Created by 임소은 on 8/11/24.
//

import SwiftUI

struct MyContestCardModel: Identifiable {
    let id = UUID()
    var MCtitle: String
    var MClikes: Int
    var MCcomments: Int
    var MCrecipeImage : UIImage?
    var MCrecipedetail : String
}
