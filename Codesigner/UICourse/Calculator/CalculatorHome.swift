//
//  CalculatorHome.swift
//  Codesigner
//
//  Created by admin on 2021/11/27.
//

import SwiftUI

struct CalculatorHome: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("☜Go Back")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 114,height: 40)
                        
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.leading)
                Spacer()
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "star")
                        
                }
                .padding(.trailing)
            }
            HStack{
                Spacer(minLength: 30)
                FunctionalCalculator()
//                    .padding(.leading)
                    .frame(width: 400, height: 700)
                    .cornerRadius(20)
                Divider()
                    .scaleEffect()
                CalculatorTextHome()
                    .padding(.trailing)
                
            }
        }
    }
}

@available(iOS 15.0, *)
struct CalculatorHome_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorHome()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
