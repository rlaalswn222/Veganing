//
//  RecipeReviewView.swift
//  Veganning
//
//  Created by 임소은 on 8/6/24.
//

import SwiftUI

struct RecipeReviewView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(0..<3) { _ in
                    VStack(alignment: .leading) {
                        HStack {
                            Text("최영우")
                            Spacer()
                            Text("2024.07.08 (화)")
                        }
                        .font(.subheadline)
                        .padding(.bottom, 2)
                        
                        HStack {
                            ForEach(0..<3) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            ForEach(0..<2) { _ in
                                Image(systemName: "star")
                                    .foregroundColor(.yellow)
                            }
                        }
                        .padding(.bottom, 2)
                        
                        Text("이 식단 맛있네요. 재료도 손쉽게 구할 수 있는 것들뿐이라 입맛 없을 때 해먹기 좋아요.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

#Preview {
    RecipeReviewView()
}
