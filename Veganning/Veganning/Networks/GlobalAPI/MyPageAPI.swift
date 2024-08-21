//
//  MyPageAPI.swift
//  Veganning
//
//  Created by 김민솔 on 8/21/24.
//

import Foundation
import Moya

enum MyPageAPI {
    
}

extension MyPageAPI: TargetType {
    var headers: [String : String]? {
        var headers: [String: String] = ["Content-Type": "application/json"]
        return headers
    }
    
    var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    var path: String {
        
    }
    
    var method: Moya.Method {
        
    }
    
    var task: Moya.Task {
        
    }
    
}
