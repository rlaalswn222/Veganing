//
//  MyPageMainModel.swift
//  Veganning
//
//  Created by 김민주 on 8/21/24.
//

import SwiftUI
import Foundation

struct MyPageMainModel: Identifiable {
    let id = UUID() // 각 모델의 고유 식별자
    var date: Int   // D-day 형식의 날짜 (예: +225)
    var nickname: String // 사용자의 닉네임
  
}

let userSampleData = [
    MyPageMainModel(date: 225, nickname: "김초록"),
    MyPageMainModel(date: 100, nickname: "이푸른")
]
