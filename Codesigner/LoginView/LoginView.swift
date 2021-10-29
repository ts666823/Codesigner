//
//  LoginView.swift
//  Codesigner
//
//  Created by admin on 2021/10/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct LoginView: View {
//    @EnvironmentObject var vm: ViewModel
    @State var showButtonView = false
    @State var password = ""
    var body: some View {
        VStack{
            HStack{
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 10){
                    Text("Hello Again,")
                        .font(.title)
                        .fontWeight(.bold)
                    HStack{
                    Text("Username")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        Button(action:{}){
                            Text("Change User")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color.purple)
                        }
                    }
                    
                }
                Spacer(minLength: 390)
                Image("default_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                Spacer(minLength: 0)
            }
            .padding(.horizontal,25)
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 12){
                Text("Password")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.leading)
                TextField("Password",text: $password)
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                Button(action:{}){
                    Text("Forget Password")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.purple)
                }
                .padding(.top,10)
            }
//            .padding(.horizontal,25)
            .padding(.top,25)
            .frame(width: 800)
            
            Button(action:{
                self.showButtonView = true
            }){
                Text("Login")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 640,height: 80)
                    .background(
                        LinearGradient(gradient: .init(colors: [Color("shadow3"),Color("shadow4")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(8)
            }
            .fullScreenCover(isPresented: $showButtonView,content: {
                TabBar()
            })
            .padding(.horizontal,25)
            .padding(.top,20)
            
            Button(action:{}){
                HStack(spacing: 35){
                    Image(systemName: "faceid")
                        .font(.system(size: 50))
                        .foregroundColor(Color("shadow3"))
                    Text("Login With Face ID")
                        .font(.system(size: 30))
                        .foregroundColor(Color("shadow3"))
                        .fontWeight(.bold)
                }
                .frame(width: 500)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color("shadow3"),lineWidth: 2))
            }
            .padding(.top,50)
           
        }
    }
}

@available(iOS 15.0, *)
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
