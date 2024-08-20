//
//  Restaurant.swift
//  Veganning
//
//  Created by 김민솔 on 8/20/24.
//

import Foundation

struct Restaurant: Identifiable {
    let id = UUID()
    let title : String
    let location : String
    let image : String
    let ing: String
    let review : Int
}
