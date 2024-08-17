//
//  CustomRoundedRectangle.swift
//  Veganning
//
//  Created by 김민솔 on 8/17/24.
//

import Foundation
import SwiftUI

struct CustomRoundedRectangle: Shape {
    var cornerRadius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let tlRadius = corners.contains(.topLeft) ? cornerRadius : 0
        let trRadius = corners.contains(.topRight) ? cornerRadius : 0
        let blRadius = corners.contains(.bottomLeft) ? cornerRadius : 0
        let brRadius = corners.contains(.bottomRight) ? cornerRadius : 0

        let width = rect.width
        let height = rect.height

        // Top left corner
        path.addArc(center: CGPoint(x: tlRadius, y: tlRadius), radius: tlRadius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        
        // Top right corner
        path.addLine(to: CGPoint(x: width - trRadius, y: 0))
        path.addArc(center: CGPoint(x: width - trRadius, y: trRadius), radius: trRadius, startAngle: .degrees(270), endAngle: .degrees(360), clockwise: false)
        
        // Bottom right corner
        path.addLine(to: CGPoint(x: width, y: height - brRadius))
        path.addArc(center: CGPoint(x: width - brRadius, y: height - brRadius), radius: brRadius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        
        // Bottom left corner
        path.addLine(to: CGPoint(x: blRadius, y: height))
        path.addArc(center: CGPoint(x: blRadius, y: height - blRadius), radius: blRadius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)

        path.closeSubpath()
        
        return path
    }
}
