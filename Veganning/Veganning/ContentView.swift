//
//  ContentView.swift
//  Veganning
//
//  Created by 김민솔 on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("비거닝")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
