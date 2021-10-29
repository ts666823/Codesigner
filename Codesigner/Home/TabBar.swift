//
//  TabBar.swift
//  SwiftUIDemo
//
//  Created by LEE on 2019/10/19.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct TabBar: View {
    @State var selectedView = 1
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $selectedView) {
            Home()
                .tabItem {
                    Image(systemName:"house.fill")
                    Text("Home")
            }
            .tag(1)
            SocialContentView()
                .tabItem {
                    Image(systemName: "person.and.person")
                    Text("Certificates")
            }
            .tag(2)
        }
        .accentColor(Color.init(red: 66/255, green: 67/255, blue: 194/255))
        .edgesIgnoringSafeArea(.top)
    }
}

@available(iOS 15.0, *)
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
.previewInterfaceOrientation(.landscapeLeft)

//            .environment(\.colorScheme, .dark)
//            .environment(\.sizeCategory, .extraExtraLarge)
    }
}
