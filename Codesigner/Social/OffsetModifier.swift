//
//  OffsetModifier.swift
//  UIKitinSwiftUI
//
//  Created by admin on 2021/10/16.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    @State var startOffset: CGFloat = 0
    
    @Binding var offset: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader{proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(OffsetKey.self){offset in
                if startOffset == 0{
                    startOffset = offset
                }
                self.offset = offset - startOffset
            }
    }
}
struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
