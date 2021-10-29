//
//  LoginView.swift
//  Codesigner
//
//  Created by admin on 2021/10/21.
//

import SwiftUI

struct SignupView: View {
    @State var user = ""
    @State var password = ""
    var body: some View {
        VStack{
            HStack{
                Spacer(minLength: 0)
                VStack(alignment: .leading, spacing: 10){
                    
                    HStack{
                    Text("Creat Account")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        
                    }
                    
                }
                Spacer(minLength: 700)

            }
            .padding(.horizontal,25)
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 12){
                Text("User Name")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.leading)
                TextField("email",text: $user)
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
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
                
            }
//            .padding(.horizontal,25)
            .padding(.top,25)
            .frame(width: 800)
            
            Button(action:{}){
                Text("Sign Up")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 640,height: 80)
                    .background(
                        LinearGradient(gradient: .init(colors: [Color("shadow3"),Color("shadow4")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(8)
            }
            .padding(.horizontal,25)
            .padding(.top,20)
            
            Button(action:{}){
                HStack(spacing: 35){
                    Image(systemName: "faceid")
                        .font(.system(size: 50))
                        .foregroundColor(Color("shadow3"))
                    Text("Sign Up With Face ID")
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
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
