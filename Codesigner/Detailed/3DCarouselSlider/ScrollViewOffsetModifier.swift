//
//  ScrollViewOffsetModifier.swift
//  myspace
//
//  Created by admin on 2021/10/9.
//

import SwiftUI

struct ScrollViewOffsetModifier: ViewModifier {
    var anchorPoint: Anchor = .top
    @Binding var offset: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader{proxy -> Color in
                    let frame = proxy.frame(in: .global)
                    DispatchQueue.main.async {
                        //based on anchor point getting offset...
                        switch anchorPoint {
                            case .top:
                                offset = frame.minY
                            case .bottom:
                                offset = frame.minY
                            case .leading:
                                offset = frame.minX
                            case .trailing:
                                offset = frame.minX
                        }
                    }
                    return Color.clear
                }
            )
    }
}
//custon Modifer for SCrollView or tab view...
//enum for custom anchor
enum Anchor{
    case top
    case bottom
    case leading
    case trailing
}

