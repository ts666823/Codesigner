//
//  LoginContent.swift
//  Codesigner
//
//  Created by admin on 2021/10/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct LoginContent: View {
    
    var body: some View {
        VStack{
            if UIScreen.main.bounds.height < 500{
                ScrollView(.vertical, showsIndicators: false){
                    LoginHome()
                }
            }
            else{
                LoginHome()
            }
        }
        .padding(.vertical)
    }
}

@available(iOS 15.0, *)
struct LoginContent_Previews: PreviewProvider {
    static var previews: some View {
        LoginContent()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
