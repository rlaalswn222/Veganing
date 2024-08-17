//
//  RecipeDetailCardModel.swift
//  Veganning
//
//  Created by 임소은 on 8/12/24.
//

import SwiftUI

import Foundation
import SwiftUI

struct RecipeDetailCardModel: Identifiable {
    let id = UUID()
    var dttitle: String
    var dtrecipeImage : UIImage?
    var dtrecipedetail : String
    var dtImageName : String
}

