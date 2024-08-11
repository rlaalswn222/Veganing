//
//  HomeView.swift
//  Veganning
//
//  Created by 김민솔 on 8/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Hello, World!")
        Image("food_image")
            .resizable()
            .frame(width: 340,height: 700)
    }
}

#Preview {
    HomeView()
}
