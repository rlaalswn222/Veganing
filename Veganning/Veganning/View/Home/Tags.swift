//
//  Tags.swift
//  Veganning
//
//  Created by 김민솔 on 8/17/24.
//

import Foundation
import SwiftUI

enum Tags: String, CaseIterable, Identifiable {
    case all = "전체"
    case hot = "HOT"
    case soyMeat = "콩고기"
    case cabbage = "양배추"
    
    var id: String {rawValue}
    
    var imageName: String? {
        switch self {
        case .all:
            return "tabMenu"
        case .hot:
            return "tabHeart"
        case .soyMeat, .cabbage:
            return nil
            
        }
    }
    
    var selectedImageName: String? {
        switch self {
        case .all:
            return "fillTabMenu"
        case .hot:
            return "fillTabHeart"
        case .soyMeat, .cabbage:
            return nil
        }
    }
}
