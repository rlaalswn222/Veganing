//
//  HomeView.swift
//  Veganning
//
//  Created by 김민솔 on 8/17/24.
//
//  HomeView.swift
//  Veganning

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
}

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let recipes = [
        Recipe(title: "Other POKE"),
        Recipe(title: "비건 라따뚜이"),
        Recipe(title: "Another Recipe")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        Image("homeBack")
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 530)
                            .clipped()
                        VStack(alignment: .leading) {
                            HomeTagsView()
                                .padding(.top, 50)
                            CarouselView(items: recipes)
                                .padding(.top, -20)
                            Text("TODAY| 240822 D+37")
                                .foregroundColor(.white)
                                .font(Font.custom("NanumSquare Neo OTF", size: 20).weight(.bold))
                                .padding(.leading, 50)
                            Text("have a good vaganing day")
                                .foregroundColor(.white)
                                .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.bold))
                                .padding(.leading, 50)
                                .padding(.bottom, 30)
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .center) {
                        HStack {
                            Text("HOT 비건 식당")
                                .foregroundColor(.main)
                                .font(Font.custom("NanumSquare Neo OTF", size: 20).bold())
                            NavigationLink(destination: RestaurantView()) {
                                Image("nextBtn")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .scaledToFit()
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        Text("8월 4주차")
                            .font(Font.custom("NanumSquare Neo OTF", size: 12))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        Text("다른 비거너들이 많이 찾는 식당이에요.")
                            .font(Font.custom("NanumSquare Neo OTF", size: 12))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.restaurants) { restaurant in
                                NavigationLink(destination: StoreDetailView()) {
                                    VStack {
                                        if let uiImage = decodeBase64ToUIImage(base64String: restaurant.image) {
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                        } else {
                                            Image("restaurant1")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                        }
                                        
                                        Text(restaurant.name)
                                            .font(Font.custom("NanumSquare Neo OTF", size: 14).bold())
                                            .foregroundColor(.black)
                                        Text(restaurant.address)
                                            .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                            .foregroundColor(.gray)
                                        HStack {
                                            Text("영업중")
                                                .font(Font.custom("NanumSquare Neo OTF", size: 12).bold())
                                                .foregroundColor(.main)
                                            Text(restaurant.open)
                                                .font(Font.custom("NanumSquare Neo OTF", size: 12).bold())
                                        }
                                        
                                        HStack {
                                            Text("리뷰 평점")
                                                .font(Font.custom("NanumSquare Neo OTF", size: 12).bold())
                                                .foregroundColor(.grey4)
                                                .frame(width: 45,height: 14)
                                            HStack {
                                                ForEach(0..<restaurant.rating, id: \.self) {_ in
                                                    Image("fillStar")
                                                        .resizable()
                                                        .frame(width: 10,height: 10)
                                                }
                                                ForEach(restaurant.rating..<5, id:\.self) {_ in
                                                    Image("star")
                                                        .resizable()
                                                        .frame(width: 10,height: 10)
                                                }
                                            }
                                        }
                                    }}
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                        }
                        .padding()
                        
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
        .scrollIndicators(.hidden)
        .onAppear {
            viewModel.fetchRestaurants()
        }
    }
    
}

// Base64 문자열을 UIImage로 변환하는 헬퍼 함수 (데이터 스킴 제거 포함)
func decodeBase64ToUIImage(base64String: String) -> UIImage? {
    // Handle potential data URI scheme
    let cleanedString = base64String.components(separatedBy: ",").last ?? base64String
    guard let imageData = Data(base64Encoded: cleanedString, options: .ignoreUnknownCharacters) else {
        return nil
    }
    return UIImage(data: imageData)
}

// 미리보기
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
