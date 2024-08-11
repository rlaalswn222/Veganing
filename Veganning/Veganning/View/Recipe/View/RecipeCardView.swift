//
//  RecipeCardView.swift
//  Veganning
//
//  Created by 김민솔 on 8/11/24.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe: RecipeCardModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image("food_image")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .clipped()
                
                VStack(alignment: .leading) {
                    HStack {
                        HStack(alignment: .center, spacing: 10) {
                            Text("HOT")
                                .font(
                                    Font.custom("NanumSquare Neo OTF", size: 14)
                                        .weight(.bold)
                                )
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 6)
                        .background(
                            Image("background_image")
                                .resizable()
                                .scaledToFill()
                        )
                        .cornerRadius(51)
                        .overlay(
                            RoundedRectangle(cornerRadius: 51)
                                .inset(by: 0.51)
                                .stroke(Color(red: 0.17, green: 0.17, blue: 0.17), lineWidth: 1.03)
                        )
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("두부")
                                .font(
                                    Font.custom("NanumSquare Neo OTF", size: 14)
                                        .weight(.bold)
                                )
                                .foregroundColor(Color(red: 0.17, green: 0.17, blue: 0.17))
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 6)
                        .background(
                            Image("background_image")
                                .resizable()
                                .scaledToFill()
                        )
                        .cornerRadius(51)
                        .overlay(
                            RoundedRectangle(cornerRadius: 51)
                                .inset(by: 0.51)
                                .stroke(Color(red: 0.17, green: 0.17, blue: 0.17), lineWidth: 1.03)
                        )
                        
                        Spacer()
                        
                        HStack(spacing: 16) {
                            Image(systemName: "bubble.left")
                        }
                        .padding(.trailing, 7)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "heart")
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
            }
            .frame(height: 120)
            
            Divider()
            
            VStack(alignment: .leading) {
                let text = "2. 볶아둔 재료를 부친 두부전에 골고루 넣어준다"
                let count = text.count
                
                Text(recipe.title)
                    .font(.headline)
                    .padding(.bottom, 4)
                Text("1. 야채와 버섯을 채를 썰어둔다")
                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                    .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                
                HStack {
                    Text(count > 15 ? "\(text.prefix(15))..." : text)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .font(Font.custom("NanumSquare Neo OTF", size: 12))
                        .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("자세히보기")
                            .font(Font.custom("NanumSquare Neo OTF", size: 10))
                            .underline()
                            .foregroundColor(Color(red: 0.48, green: 0.48, blue: 0.48))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
        .buttonStyle(PlainButtonStyle())
        .navigationBarBackButtonHidden()
    }
}
