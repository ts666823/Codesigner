//
//  CustomCorner.swift
//  UIKitinSwiftUI
//
//  Created by admin on 2021/10/16.
//

import SwiftUI

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect)->Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
