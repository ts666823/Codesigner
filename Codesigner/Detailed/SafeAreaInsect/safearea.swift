//
//  safearea.swift
//  myspace
//
//  Created by admin on 2021/10/6.
//

import SwiftUI
@available(iOS 15.0, *)
struct safeAreaView:View{
    @Environment(\.presentationMode) var presentationMode
    @State private var safeAreaEffect = VerticalEdge.bottom
    var body: some View{
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
        ScrollView{
            VStack(spacing: 18){
                ForEach(1...25, id:\.self){_ in
                    HStack{
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 45, height: 45)
                        VStack(alignment: .leading, spacing: 15){
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 15)
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 15)
                                .padding(.trailing,50)
                        }
                    }
                }
            }
            .padding()
        }
        .safeAreaInset(edge: safeAreaEffect){
            Capsule()
                .fill(Color.blue)
                .frame(width: 550, height: 55)
                .padding(.horizontal)
        }
        .padding()
            safeAreaTextView(safeareaEffect: $safeAreaEffect)
    }
    }
    }
}
@available(iOS 15.0, *)
struct safeAreaView_Previews: PreviewProvider {
    static var previews: some View {
        safeAreaView()
.previewInterfaceOrientation(.landscapeLeft)
//            .previewLayout(.fixed(width: 670, height: 984))

    }
}
