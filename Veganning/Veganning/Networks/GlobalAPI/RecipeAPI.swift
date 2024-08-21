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
    case recipeDetail(status: Int, success: Bool, image :String, name:String, ingredients:  Array<String>)//레시피 상세조회
    case recipeContest(name:String, description:String,image:String,type:String, carbonhydrate:Double, sugar : Double, protein: Double, fat: Double)//레시피 작성
    case myContestList(status : Int, success : Bool, message : String, data : String )// 내공모 리스트
    case recipeSaving(message : String, newSaving:Array<String>)// 레시피 세이브닝
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
        case .recipeDetail:
            return "/recipes"
        case .recipeContest:
            return "/recipes"
        case .myContestList:
            return "/recipes/{userId}/myRecipes"
        case .recipeSaving:
            return "/recipes/{recipeID}/savning"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recipeList:
            return .get
        case .recipeDetail:
            return .get
        case .recipeContest:
            return .post
        case .myContestList:
            return .post
        case .recipeSaving:
            return .post
        }
        
    }
    
    var task: Moya.Task {
        switch self {
        case .recipeList(let type, let fromrecruit):
            return .requestParameters(parameters:
                                        ["type" : type, "fromrecruit" : fromrecruit],
                                      encoding: URLEncoding.queryString)
            
        case .recipeDetail(let status, let success, let image, let name, let ingredients):
            return .requestParameters(parameters: [
                "status": status,
                "success": success,
                "image": image,
                "name": name,
                "ingredients": ingredients
            ], encoding: URLEncoding.queryString)
            
        case .recipeContest(let name,  let description, let image, let type, let carbonhydrate,  let sugar,  let protein,  let fat):
            return .requestParameters(parameters: [
                "name" : name,
                "description" : description,
                "image" :image,
                "type" : type,
                "carbonhydrate" : carbonhydrate,
                "sugar" : sugar,
                "protein" : protein,
                "fat": fat
            ],encoding: URLEncoding.queryString)
            
        case .myContestList(let status, let success, let message, let data):
            return .requestPlain
            
        case .recipeSaving(let message, let newSaving):
            return .requestPlain
        }
        
        
    }
    
    
}
