//
//  CustomTabView.swift
//  Veganning
//
//  Created by 김민솔 on 8/8/24.
//

import SwiftUI

enum Tab {
    case first
    case second
    case third
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            Spacer()
            Button {
                selectedTab = .first
            } label: {
                Image("book")
            }
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 90, height: 90)
                Button {
                    selectedTab = .second
                } label: {
                    Image("tabIcon")
                }
            }
            .offset(y: -32)
            Spacer()
            Button {
                selectedTab = .third
            } label: {
                Image("user")
            }
            Spacer()
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedTab: Tab = .first

        return CustomTabView(selectedTab: $selectedTab)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
