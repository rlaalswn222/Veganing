//
//  BaseResponse.swift
//  Veganning
//
//  Created by 김민솔 on 8/21/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let isSuccess: Bool
    let code: Int
    let data: T?
    let message: String
}
