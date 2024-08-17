//
//  HomeTagsView.swift
//  Veganning
//
//  Created by 김민솔 on 8/17/24.
//

import SwiftUI

struct HomeTagsView: Viaaaaew {
    @State private var selectedTag: Tags = Tags.all
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Tags.allCases) { tag in
                    TagView(tag: tag, isSelected: tag == selectedTag)
                        .onTapGesture {
                            selectedTag = tag
                        }
                }
            }
            .padding()
        }
    }
}


struct TagView: View {
    var tag: Tags
    var isSelected: Bool
    
    var body: some View {
        Button(action: {
            print("Selected tag: \(tag.rawValue)")
        }) {
            HStack {
                if let imageName = isSelected ? tag.selectedImageName : tag.imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 11, height: 11)
                        .padding(.leading,10)
                }
                
                Text(tag.rawValue)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(isSelected ? Color.sub1: Color.white)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
            }
            .padding(.horizontal, 5)
            .background(
                RoundedRectangle(cornerRadius: 47)
                    .fill(isSelected ? Color.main : Color.gray.opacity(0.2))
            )
        }
        .overlay (
            RoundedRectangle(cornerRadius: 47)
                .stroke(isSelected ? Color.main : Color.white,lineWidth: 1)
        )
    }
}

