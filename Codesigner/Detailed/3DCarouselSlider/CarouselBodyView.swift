//
//  CarouselBodyView.swift
//  myspace
//
//  Created by admin on 2021/10/9.
//

import SwiftUI
struct CarouselBodyView:View{
    var index: Int
    //Offset
    @State var offset: CGFloat = 0
    var body: some View{
        //Edit your main view and other detail...
        GeometryReader{proxy in
            let size = proxy.size
            ZStack{
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width-8, height: size.height/1.2)
                    .cornerRadius(12)
                
                VStack{
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Some Movie Pictures")
                            .font(.largeTitle.bold())
                    }
                    .foregroundColor(.blue)
                    .padding(.top)
                    Spacer(minLength: 0)
                }
                .padding(20)
               
            }
            .frame(width: size.width-8, height: size.height/1.2)
            .frame(width: size.width, height: size.height)
        }
        //setting tag...
        .tag("p\(index)")
        //Custom 3D Rotation...
        //Since we need from 0 so we are getting leading offset...
        .modifier(ScrollViewOffsetModifier(anchorPoint: .leading, offset: $offset))
        //Rotation...
        .rotation3DEffect(.init(degrees: getProgress()*90), axis: (x:0,y:1,z:0),anchor: offset > 0 ? .leading : .trailing,anchorZ: 0,perspective: 1)
    }
    //geting progress...
    func getProgress()->CGFloat{
        let progress = -offset / UIScreen.main.bounds.width
        return progress
    }
}

@available(iOS 15.0, *)
struct CarouselBodyView_Previews:PreviewProvider{
    static var previews: some View{
        SliderContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
