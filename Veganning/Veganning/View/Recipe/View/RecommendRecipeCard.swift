//
//  RecommendRecipeCard.swift
//  Veganning
//
//  Created by 임소은 on 8/12/24.
//

import SwiftUI

struct RecommendRecipeCardView: View {
    let model: RecommendRecipeModel
    
    var body: some View {
        HStack {
            if let image = model.RRrecipeImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                Image("food_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(model.RRtitle)
                    .font(.headline)
                
                HStack {
                    ForEach(0..<model.RRrating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    ForEach(model.RRrating..<5, id: \.self) { _ in
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                    Text("(\(model.RRtotalRatings))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 2)
                
                ForEach(model.RRinstructions.prefix(2), id: \.self) { instruction in
                    Text(instruction)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.leading, 10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

