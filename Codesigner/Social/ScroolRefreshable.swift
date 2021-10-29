//
//  ScroolRefreshable.swift
//  UIKitinSwiftUI
//
//  Created by admin on 2021/10/16.
//

import SwiftUI

@available(iOS 15.0, *)
@available(iOS 15.0, *)
struct ScroolRefreshable<Content: View>: View {
    var content: Content
    var onRefresh: () async ->()
    init(title: String,tintColor:Color,@ViewBuilder content: @escaping ()->Content,onRefresh: @escaping () async ->()){
        self.content = content()
        self.onRefresh = onRefresh
        
        let refreshControl = UIRefreshControl.appearance()
        
        refreshControl.bounds = CGRect(x: refreshControl.bounds.origin.x, y: -(230-getSafeArea().top)+refreshControl.bounds.origin.y, width: refreshControl.bounds.size.width, height: refreshControl.bounds.size.height)
        
        UIRefreshControl.appearance().attributedTitle = NSAttributedString(string: title)
        UIRefreshControl.appearance().tintColor = UIColor(tintColor)
    }
    var body: some View {
        List{
            content
                .listRowSeparatorTint(.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .refreshable {
            await onRefresh()
        }
    }
}


