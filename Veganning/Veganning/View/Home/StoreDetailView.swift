//
//  StoreDetailView.swift
//  Veganning
//
//  Created by 김민솔 on 8/22/24.
//

import SwiftUI

struct StoreDetailView: View {
    var body: some View {
        VStack {
            Image("backGround")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 410)
            
            HStack {
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.sub1)
                            .frame(width: 30, height: 30)
                        Text("1")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    Text("정보")
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.sub3)
                            .frame(width: 30, height: 30)
                        Text("2")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    Text("레시피")
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.sub3)
                            .frame(width: 30, height: 30)
                        Text("3")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    Text("메뉴")
                        .foregroundColor(.black)
                }
                Spacer()
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.sub3)
                            .frame(width: 30, height: 30)
                        Text("4")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    Text("리뷰")
                        .foregroundColor(.black)
                }
            }
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image("locationsmall")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("서울 강남구 압구정로4길 19")
                        .foregroundColor(.black)
                }
                
                HStack {
                    Image("clock")
                        .resizable()
                        .frame(width: 20, height: 20)
                    VStack(alignment: .leading) {
                        Text("수-일 11:00 ~ 22:00")
                        Text("브레이크 타임 15:00 ~ 18:00")
                        Text("월, 화 휴무")
                    }
                    .foregroundColor(.black)
                }
                
                HStack {
                    Image("globe")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("https://www.naver.com")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            // Add link action if needed
                        }
                }
                
                HStack {
                    Image("phone")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("043-127-1270")
                        .foregroundColor(.black)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 40)
        .padding(.top, 16)
        
        Spacer()
    }
    
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView()
    }
}
