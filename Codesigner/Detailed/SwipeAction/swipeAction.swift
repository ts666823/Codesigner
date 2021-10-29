//
//  swipeAction.swift
//  myspace
//
//  Created by admin on 2021/10/6.
//

import SwiftUI
//@available(iOS 15.0, *)
@available(iOS 15.0, *)
struct swipeActionView:View{
    @Environment(\.presentationMode) var presentationMode
    @State private var swipeActionEffect = HorizontalEdge.trailing
    var body: some View{
        VStack {
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
            List{
                ForEach(1...10,id:\.self){index in
                    Text("Label \(index)")
                    //swipe Action...
                        .swipeActions(edge: swipeActionEffect, allowsFullSwipe: false){
                            Button{
                                
                            }label:{
                                Image(systemName: "house.fill")
                            }
                            .tint(.blue)
                        }
                }
            }
            .padding()
            swipeActionTextView(swipeActionEffect: $swipeActionEffect)
            }
        }
    }
}
@available(iOS 15.0, *)
struct swipeActionView_Previews:PreviewProvider{
    static var previews: some View{
        swipeActionView().previewInterfaceOrientation(.landscapeLeft)
    }
}
