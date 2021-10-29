//
//  ContentView.swift
//  myspace
//
//  Created by admin on 2021/10/9.
//

import SwiftUI

@available(iOS 15.0, *)
struct SliderContentView:View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View{

            HStack{
                VStack{
                    
                    
                    SliderHome()
                }
                VStack{
                    HStack{
                        Spacer()
                    Button(action:{
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "star")
                            
                    }
                    .padding(.trailing)
                    }
                    SliderText()
                }
            }
    }
}

@available(iOS 15.0, *)
struct SliderContentView_Previews:PreviewProvider{
  
    static var previews: some View
    {
        SliderContentView().previewInterfaceOrientation(.landscapeLeft)
    }
}
