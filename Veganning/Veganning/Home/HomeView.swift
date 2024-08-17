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
    let recipes = [
        Recipe(title: "Other POKE"),
        Recipe(title: "Green POKE"),
        Recipe(title: "Another Recipe")
    ]
    
    var body: some View {
        ScrollView {
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
                        .font(.system(size: 20,weight: .bold))
                        .padding(.leading,50)
                    Text("have a good vaganing day")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .padding(.leading,50)
                        .padding(.bottom,30)
                    
                    
                }
                
                Spacer()
            }
            Text("HOT 비건 식당 >")
                .foregroundColor(.black)
                .font(.system(size: 20))
        }
        .edgesIgnoringSafeArea(.all)
    }
}
