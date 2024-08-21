//
//  RecipeSaveModel.swift
//  Veganning
//
//  Created by 김민주 on 8/21/24.
//

import Foundation

struct RecipeSaveModel: Identifiable{
    let id = UUID()
    let imageName: String
    
    var title: String
    var nickname: String
    var description1: String
    var description2: String
    var delete: Bool
    var hot: Bool
    var ingredient: String?
}

let sampleRecipeData = [
    RecipeSaveModel(imageName: "Recipe01", title: "두부 카츠 카레", nickname: "초록 비거너님이 선호하는 재료를 사용해요!", description1: "1. 재료를 한 입 크기로 썬 다음 두툼한 냄비에 넣고 기름을 둘러 충분히 볶습니다", description2:" 2. 냄비에 물을 붓고 끓기 시작하면 불을 줄여줍니다. 재료가 부드러워질 때까지 끓입니다", delete: false, hot: true, ingredient: "두부"),
    RecipeSaveModel(imageName: "Recipe01",title: "두부 너겟", nickname: "초록 비거너님이 선호하는 재료를 사용해요!", description1: "고기 대신 콩 패티를 사용한 버거", description2: "", delete: false, hot: false, ingredient: "두부")
]
