//
//  LoginHome.swift
//  Codesigner
//
//  Created by admin on 2021/10/21.
//

import SwiftUI

@available(iOS 15.0, *)
@available(iOS 15.0, *)
struct LoginHome: View {
    
    @State var index = 0
    @Namespace var name
    var body: some View {
        VStack{
            Image("Codesigner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            HStack(spacing: 0){
                Button(action: {
                    withAnimation(.spring()){
                        index = 0
                    }
                }){
                    VStack{
                        Text("Login")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? .black : .gray)
                        ZStack{
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame(height: 5)
                            if index == 0{
                                Capsule()
                                    .fill(Color("shadow3"))
                                    .frame(height: 5)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
                Button(action: {
                    withAnimation(.spring()){
                        index = 1
                    }
                }){
                    VStack{
                        Text("Sign Up")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? .black : .gray)
                        ZStack{
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame(height: 5)
                            if index == 1{
                                Capsule()
                                    .fill(Color("shadow3"))
                                    .frame(height: 5)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
            }
            .padding(.top,-10)
            if index == 0{
                LoginView()
            }
            else {
                SignupView()
            }
        }
    }
}

@available(iOS 15.0, *)
struct LoginHome_Previews: PreviewProvider {
    static var previews: some View {
        LoginHome()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
