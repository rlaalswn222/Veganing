//
//  HomeAPI.swift
//  Veganning
//
//  Created by 김민솔 on 8/21/24.
//

import Foundation
import Moya

enum HomeAPI {
    case weeklyStore //이번주 hot 비건식당 4개
    //
}

<<<<<<< Updated upstream
extension HomeAPI: TargetType {
    var headers: [String : String]? {
        var headers: [String: String] = ["Content-Type": "application/json"]
        return headers
    }
    
    var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    var path: String {
        switch self {
        case .weeklyStore:
            return "/home/weekly/store"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .weeklyStore:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .weeklyStore:
            return .requestPlain
        }
    }
    
}
=======
//extension HomeAPI: TargetType {
//    var headers: [String : String]? {
//        var headers: [String: String] = ["Content-Type": "application/json"]
//        return headers
//    }
//    
//    var baseURL: URL {
//        return URL(string: GeneralAPI.baseURL)!
//    }
//    
//    var path: String {
//        
//    }
//    
//    var method: Moya.Method {
//        
//    }
//    
//    var task: Moya.Task {
//        
//    }
//    
//}
>>>>>>> Stashed changes


