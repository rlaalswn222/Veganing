//
//  FilterBar.swift
//  Veganning
//
//  Created by 김민솔 on 8/11/24.
//

import SwiftUI

struct FilterBar: View {
    @Binding var selectedFilter: String
    
    private let filters = ["전체", "락토", "비건", "오보", "락토오보","페스코"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 10) {
                ForEach(filters, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                    }) {
                        Text(filter)
                            .font(Font.custom("NanumSquare Neo OTF", size: 14).weight(.bold))
                            .foregroundColor(selectedFilter == filter ? .black : Color.grey4)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(selectedFilter == filter ? Color.sub1 : Color.clear)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .inset(by: 0.89)
                                    .stroke(selectedFilter == filter ? Color.sub1 : Color.grey2, lineWidth: 1.77)
                            )
                    }
                }
            }
            .padding(.horizontal)
            .padding(10)
        }
    }
}
