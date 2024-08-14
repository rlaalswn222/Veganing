//
//  RecommendRecipeModel.swift
//  Veganning
//
//  Created by 임소은 on 8/12/24.
//
import SwiftUI
import Foundation

struct RecommendRecipeModel: Identifiable {
    let id = UUID()
    var RRtitle: String
    var RRrecipeImage: UIImage?
    var RRrating: Int
    var RRtotalRatings: Int
    var RRinstructions: [String]
}
