//
//  WeeklyStoreResponse.swift
//  Veganning
//
//  Created by 김민솔 on 8/22/24.
//

import Foundation

struct WeeklyStoreResponse: Codable {
    let id: Int
    let name: String
    let address: String
    let open: String
    let rating: Int
    let isOpen: Bool
    let image: String?
}
