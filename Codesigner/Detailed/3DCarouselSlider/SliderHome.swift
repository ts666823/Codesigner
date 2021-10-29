
//
//  SliderHome.swift
//  myspace
//
//  Created by admin on 2021/10/9.
//

import SwiftUI

@available(iOS 15.0, *)
struct SliderHome:View{
    @Environment(\.presentationMode) var presentationMode
    //BackGround will be current tab image
    @State var currentTab = "p1"
    var body: some View{
        ZStack{
            
            
            //Geometry reader for getting screen size
            GeometryReader{proxy in
                let size = proxy.size
                

                Image(currentTab)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(1)
            }
            .ignoresSafeArea()
            //Material Effect
            .overlay(.ultraThinMaterial)
            //Dark Effect...
            .colorScheme(.dark)
            
//            Carousel List...
            TabView(selection:$currentTab){
                ForEach(1...3,id: \.self){index in
                    CarouselBodyView(index: index)

                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

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
                .padding(.bottom, 730.0)
                Spacer()
            }
        }
    }
}
@available(iOS 15.0, *)
struct SliderHome_Previews:PreviewProvider{
    static var previews: some View
    {
        SliderHome()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
