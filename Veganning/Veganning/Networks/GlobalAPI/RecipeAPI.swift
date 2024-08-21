//
//  RecipeAPI.swift
//  Veganning
//
//  Created by 김민솔 on 8/21/24.
//

import Foundation
import Moya

enum RecipeAPI {
    case recipeList(type: String, fromrecruit: Bool) //recipe 리스트
    //레시피 상세조회
    //레시피 작성
    // 내공모 리스트
    // 레시피 세이브닝
}

extension RecipeAPI: TargetType {
    var headers: [String : String]? {
        var headers: [String: String] = ["Content-Type": "application/json"]
        return headers
    }
    var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    var path: String {
        switch self {
        case .recipeList:
            return "/recipes"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recipeList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .recipeList(let type, let fromrecruit):
            return .requestParameters(parameters:
                ["type" : type, "fromrecruit" : fromrecruit],
              encoding: URLEncoding.queryString)
        }
    }
    
}
