//
//  RestaurantView.swift
//  Veganning
//
//  Created by 김민솔 on 8/21/24.
//

import Foundation
import SwiftUI

struct RestaurantView: View {
    let tags = ["전체", "락토", "비건", "오보", "락토 오보", "페스코"]
    let locations = [
        Location(image: "location", name: "지역 검색"),
        Location(image: "location0", name: "전체"),
        Location(image: "location1", name: "압구정 청담"),
        Location(image: "location2", name: "잠실 송파"),
        Location(image: "location3", name: "이태원 한남")
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let restaurants = [
        HotRestarant(title: "달리아 다이닝", location: "Seoul", image: "restaurant1", ing: "12:00 ~ 21:30", review: 3),
        HotRestarant(title: "펀치브런치바", location: "Busan", image: "restaurant2", ing: "12:00 ~ 21:30", review: 2),
        HotRestarant(title: "아민 연남", location: "Daegu", image: "restaurant3", ing: "12:00 ~ 21:30", review: 5),
        HotRestarant(title: "레이지 파머스", location: "Incheon", image: "restaurant4", ing: "12:00 ~ 21:30", review: 4),
        HotRestarant(title: "빌라드 코스테스", location: "Incheon", image: "restaurant5", ing: "12:00 ~ 21:30", review: 4),
        HotRestarant(title: "바이두부", location: "Incheon", image: "restaurant6", ing: "12:00 ~ 21:30", review: 4)
    ]
    @State private var selectedTags: [String] = []
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            NavigationView {
                VStack(alignment: .leading) {
                    Text("지역을 선택할 수 있어요")
                        .font(Font.custom("NanumSquare Neo OTF", size: 16))
                        .foregroundColor(.white)
                        .padding(.leading,20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(locations, id: \.self) { location in
                                VStack {
                                    Image(location.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 56, height: 56)
                                        .background(Circle().fill(Color.white)) // White background circle
                                        .clipShape(Circle())
                                        .shadow(radius: 5)
                                    
                                    Text(location.name)
                                        .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .frame(height: 80)
                }
                .frame(height: 148)
                .frame(maxWidth: .infinity)
                .background(Color.main2)
                .padding(.top,-120)
            }
            TagsView(tags: tags, selectedTags: $selectedTags)
                .frame(height: 50)
                .padding(.bottom,20)
                .padding(.top,-120)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(restaurants) { restaurant in
                        VStack {
                            Image(restaurant.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 2)
                                )
                            Text(restaurant.title)
                                .font(Font.custom("NanumSquare Neo OTF", size: 14).bold())
                                .foregroundColor(.black)
                            Text(restaurant.location)
                                .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                .foregroundColor(.gray)
                            HStack {
                                Text("영업중")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12).bold())
                                    .foregroundColor(.main)
                                    .multilineTextAlignment(.leading)
                                
                                Text(restaurant.ing)
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12).bold())
                            }
                            
                            HStack {
                                Text("리뷰 평점")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12).bold())
                                    .foregroundColor(.grey4)
                                    .frame(width: 45,height: 14)
                                HStack {
                                    ForEach(0..<restaurant.review, id: \.self) {_ in
                                        Image("fillStar")
                                            .resizable()
                                            .frame(width: 10,height: 10)
                                    }
                                    ForEach(restaurant.review..<5, id:\.self) {_ in
                                        Image("star")
                                            .resizable()
                                            .frame(width: 10,height: 10)
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding(.top,10)
            }
            .padding(.top,-50)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("backBTN")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            ToolbarItem(placement: .principal) {
                VStack(alignment: .leading) {
                    Text("HOT 비건식당 127")
                        .font(Font.custom("NanumSquare Neo OTF", size: 20))
                    Text("5월3주차, 다른비거너들이 많이 찾는 비건 식당이에요.")
                        .font(Font.custom("NanumSquare Neo OTF", size: 11))
                        .foregroundColor(.grey4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
    }
}
