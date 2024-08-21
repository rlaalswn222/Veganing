//
//  TodayKcalCardView.swift
//  Veganning
//
//  Created by 김민주 on 8/22/24.
//

import SwiftUI

struct TodayKcalCardView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Card background with shadow and corner radius
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .frame(height: 122)
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    // Total Calories
                    Text("총 칼로리 1680 kcal")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                    
                    // Macronutrient Info
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 8, height: 8)
                                Text("탄수화물")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.black))
                                    .foregroundColor(.black)
                            }
                            Text("900kcal [130%]")
                                .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 8, height: 8)
                                Text("지방")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.black))
                                    .foregroundColor(.black)
                            }
                            Text("580kcal [110%]")
                                .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 8, height: 8)
                                Text("단백질")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.black))
                                    .foregroundColor(.black)
                            }
                            Text("200kcal [100%]")
                                .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.leading, 20)
                
                Spacer()
                
                // Pie chart on the right
                Image("pie_chart")  // Ensure this matches the name in your asset catalog
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 20)
            }
            .padding()
            Image("pichart")  // Replace with the correct asset name
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .rotationEffect(.degrees(-15))
                .position(x: UIScreen.main.bounds.width - 60, y: 20)
        }
        .padding(.horizontal)
    }
}

#Preview {
    TodayKcalCardView()
}
