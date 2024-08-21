//
//  TagsView.swift
//  Veganning
//
//  Created by 김민솔 on 8/21/24.
//

import Foundation
import SwiftUI

struct TagsView: View {
    let tags: [String]
    @Binding var selectedTags: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(selectedTags.contains(tag) ? Color.sub1 : Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.grey2, lineWidth: 1)
                                )
                        )
                        .foregroundColor(selectedTags.contains(tag) ? Color.black : Color.grey4)
                        .onTapGesture {
                            if let index = selectedTags.firstIndex(of: tag) {
                                selectedTags.remove(at: index)
                            } else {
                                selectedTags.append(tag)
                            }
                        }
                        .onAppear {
                            if selectedTags.isEmpty, let firstTag = tags.first {
                                selectedTags.append(firstTag)
                            }
                        }
                }
            }
            .padding(.leading, 5)
        }
        .padding(.horizontal, 16)
    }
}



