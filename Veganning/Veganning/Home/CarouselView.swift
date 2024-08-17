//
//  CarouselView.swift
//  Veganning
//
//  Created by 김민솔 on 8/17/24.
//

import Foundation
import SwiftUI

struct CarouselView: View {
    let items: [Recipe]
    let sideItemScale: CGFloat = 0.5
    let sideItemAlpha: CGFloat = 0.5
    let spacing: CGFloat = 10

    @State private var scrollOffset: CGFloat = 0
    @State private var selectedIndex: Int = 1

    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: spacing) {
                        ForEach(items.indices) { index in
                            HomeCardView(title: items[index].title, subtitle: "This is a subtitle")
                                .frame(width: geometry.size.width * 0.8)
                                .scaleEffect(scale(for: index, in: geometry.size.width))
                                .opacity(opacity(for: index, in: geometry.size.width))
                                .padding(.vertical, 20)
                                .id(index)
                        }
                    }
                    .padding(.horizontal, (geometry.size.width - (geometry.size.width * 0.8)) / 2)
                    .offset(x: -scrollOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                scrollOffset = value.translation.width
                            }
                            .onEnded { _ in
                                scrollOffset = 0
                            }
                    )
                }
                .frame(width: geometry.size.width, height: 360)
                .onAppear {
                    withAnimation {
                        scrollViewProxy.scrollTo(selectedIndex, anchor: .center)
                    }
                }
            }
        }
    }
    
    private func scale(for index: Int, in width: CGFloat) -> CGFloat {
        let itemWidth: CGFloat = width * 0.8
        let itemCenter = (width / 2) - scrollOffset
        let center = itemWidth / 2
        let distance = abs(center - itemCenter)
        let maxDistance = (itemWidth + spacing) / 2
        let ratio = (maxDistance - distance) / maxDistance
        return ratio * (1 - sideItemScale) + sideItemScale
    }
    
    private func opacity(for index: Int, in width: CGFloat) -> Double {
        let itemWidth: CGFloat = width * 0.8
        let itemCenter = (width / 2) - scrollOffset
        let center = itemWidth / 2
        let distance = abs(center - itemCenter)
        let maxDistance = (itemWidth + spacing) / 2
        let ratio = (maxDistance - distance) / maxDistance
        return Double(ratio * (1 - sideItemAlpha) + sideItemAlpha)
    }
}
