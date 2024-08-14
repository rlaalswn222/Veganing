//
//  RecipeReviewCard.swift
//  Veganning

import SwiftUI

struct RecipeReviewCardView: View {
    let model: RecipeReviewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(model.RVreviewerName)
                Spacer()
                Text(model.RVreviewDate)
            }
            .font(.subheadline)
            .padding(.bottom, 2)
            
            HStack {
                ForEach(0..<model.RVrating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                ForEach(model.RVrating..<5, id: \.self) { _ in
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
            .padding(.bottom, 2)
            
            Text(model.RVcomment)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

