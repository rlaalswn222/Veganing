//
//  HotRestarant.swift
//  Veganning
//
//  Created by 김민솔 on 8/22/24.
//

import Foundation

struct HotRestarant: Identifiable {
    var id = UUID()
    let title : String
    let location: String
    let image: String
    let ing: String
    let review: Int
}
