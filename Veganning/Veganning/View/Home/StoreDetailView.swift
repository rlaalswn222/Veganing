//
//  StoreDetailView.swift
//  Veganning
//
//  Created by 김민솔 on 8/22/24.
//

import SwiftUI


struct StoreDetailView: View {
    var body: some View {
        Image("backGround")
            .frame(maxWidth: .infinity)
            .frame(height: 410)
        HStack {
            Image("locationsmall")
                .resizable()
                .frame(width: 20,height: 20)
            Text("서울 강남구 압구정로4길 19")
        }
        HStack {
            Image("clock")
                .resizable()
                .frame(width: 20,height: 20)
            VStack {
                Text("수-일 11:00 ~ 22:00")
                Text("브레이크 타임 15:00 ~ 18:00")
                Text("월, 화 휴무")
            }
        }
        HStack {
            Image("globe")
                .resizable()
                .frame(width: 20,height: 20)
            Text("https://www.naver.com")
        }
        HStack {
            Image("phone")
                .resizable()
                .frame(width: 20,height: 20)
            Text("043-127-1270")
        }
        
    }
}
