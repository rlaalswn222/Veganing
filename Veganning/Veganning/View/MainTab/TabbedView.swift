//
//  TabbedView.swift
//  Veganning
//
//  Created by 김민솔 on 8/11/24.
//

import SwiftUI

struct TabbedView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack {
            switch selectedTab {
            case .recipe:
                RecipeMainView()
            case .home:
                HomeView()
            case .myPage:
                MyPageView()
            }
            
            
            
            CustomTabView(selectedTab: $selectedTab)
               
        }
    }
}
