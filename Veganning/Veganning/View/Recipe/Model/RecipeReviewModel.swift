//
//  RecipeReviewModel.swift
//  Veganning
//
//  Created by 임소은 on 8/12/24.
import SwiftUI
import Foundation

struct RecipeReviewModel: Identifiable {
    let id = UUID()
    var RVreviewerName: String
    var RVreviewDate: String
    var RVrating: Int
    var RVcomment: String
}
