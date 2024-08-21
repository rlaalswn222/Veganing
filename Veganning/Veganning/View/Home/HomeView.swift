//
//  HomeView.swift
//  Veganning
//
//  Created by 김민솔 on 8/17/24.
//
import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
}

struct HomeView: View {
    let restaurants = [
        Restaurant(title: "Vegan Delight", location: "Seoul", image: "restaurant1", ing: "12:00 ~ 21:30", review: 3),
        Restaurant(title: "Green Bites", location: "Busan", image: "restaurant2", ing: "12:00 ~ 21:30", review: 2),
        Restaurant(title: "Healthy Feast", location: "Daegu", image: "restaurant3", ing: "12:00 ~ 21:30", review: 5),
        Restaurant(title: "Plant Power", location: "Incheon", image: "restaurant4", ing: "12:00 ~ 21:30", review: 4)
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let recipes = [
        Recipe(title: "Other POKE"),
        Recipe(title: "Green POKE"),
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
                                .padding(.top,50)
                            CarouselView(items: recipes)
                                .padding(.top,-20)
                            Text("TODAY| 240715 D+37")
                                .foregroundColor(.white)
                                .font(Font.custom("NanumSquare Neo OTF", size: 20).weight(.bold))
                                .padding(.leading,50)
                            Text("have a good vaganing day")
                                .foregroundColor(.white)
                                .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.bold))
                                .padding(.leading,50)
                                .padding(.bottom,30)
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
                        .padding(.top,20)
                        Text("5월 3주차")
                            .font(Font.custom("NanumSquare Neo OTF", size: 12))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        Text("다른 비거너들이 많이 찾는 식당이에요.")
                            .font(Font.custom("NanumSquare Neo OTF", size: 12))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
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
                                        Text(restaurant.ing)
                                            .font(Font.custom("NanumSquare Neo OTF", size: 12).bold())
                                    }
                                    
                                    HStack {
                                        Text("리뷰 평점")
                                            .font(Font.custom("NanumSquare Neo OTF", size: 12).bold())
                                            .foregroundColor(.grey4)
                                            .frame(width: 40,height: 14)
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
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                        }
                        .padding()
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }}
        .scrollIndicators(.hidden)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
