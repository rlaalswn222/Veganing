//
//  HomeCardView.swift
//  Veganning
//
//  Created by 김민솔 on 8/17/24.
//

import SwiftUI

struct HomeCardView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        ZStack {
            CustomRoundedRectangle(cornerRadius: 50, corners: [.topRight, .bottomLeft, .bottomRight])
                .fill(Color.white.opacity(0.2))
                .blur(radius: 0.2)
                .overlay(
                    CustomRoundedRectangle(cornerRadius: 50, corners: [.topRight, .bottomLeft, .bottomRight])
                        .stroke(Color.white, lineWidth: 1)
                )
                .overlay(
                    VStack(alignment: .leading) {
                        HStack {
                            Text(title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.sub1)
                                .padding(.trailing,20)
                            Image("fillHeart")
                                .resizable()
                                .frame(width: 20,height: 20)
                        }
                        .padding(.top, 20)
                        Text(subtitle)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.top, 8)
                        
                        Spacer()
                        HStack {
                            Button(action: {
                                // 버튼 액션
                            }) {
                                Text("레시피 보러가기")
                                    .font(.system(size: 14,weight: .bold))
                                    .foregroundColor(.sub1)
                                    .padding(.horizontal,18)
                                    .padding(.vertical,8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.black.opacity(0.7))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.sub1, lineWidth: 1)
                                    )
                                    .cornerRadius(10)
                            }
                            .padding(.bottom, 16)
                            
                            Image("Homecard")
                                .resizable()
                                .frame(width: 178, height: 200)
                                .padding(.trailing,-10.488)
                        }
                    }
                )
        }
    }
}



struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView(title: "Recipe Title", subtitle: "This is a subtitle")
            .previewLayout(.sizeThatFits)
    }
}
