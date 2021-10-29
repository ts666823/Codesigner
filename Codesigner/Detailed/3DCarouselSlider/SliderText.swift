//
//  SliderText.swift
//  myspace
//
//  Created by admin on 2021/10/9.
//

import SwiftUI
struct SliderText: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
        VStack(alignment: .leading, spacing: 5){
            Group{
                Text("Code:")
                    .font(.title)
                    .foregroundColor(.black)
                Divider()
                    .border(Color.white, width: 5)
                
                TextView(str:"var body: some View{")
                Text("  //Edit your main view and other detail...")
                    .foregroundColor(.gray)
                TextView(str: "  GeometryReader{... proxy in}")
                Text("  //setting tag...")
                    .foregroundColor(.gray)
                TextView(str: "  .tag(\"p\\(index)\")")
                Text("  //Custom 3D Rotation...")
                    .foregroundColor(.gray)
                
                Text("  //Since we need from 0 so we are getting leading offset...")
                    .foregroundColor(.gray)
                TextView(str: "  .modifier(ScrollViewOffsetModifier(anchorPoint: .leading, offset: $offset))")
                
            }
            Group{
                Text("  //Rotation...")
                    .foregroundColor(.gray)
                TextView(str: "  .rotation3DEffect(.init(degrees: getProgress()*90), axis: (x:0,y:1,z:0),anchor: offset > 0 ? .leading : .trailing,anchorZ: 0,perspective: 1) }")
                Text("//geting progress...")
                    .foregroundColor(.gray)
                TextView(str: "func getProgress()->CGFloat{")
                TextView(str: "    let progress = -offset / UIScreen.main.bounds.width")
                TextView(str: "    return progress } }")
                Divider()
                    .border(Color.white, width: 5)
            }
            Group{
                TextView(str: "struct ScrollViewOffsetModifier: ViewModifier {")
                TextView(str: "    var anchorPoint: Anchor = .top")
                TextView(str: "    @Binding var offset: CGFloat")
                TextView(str: "    func body(content: Content) -> some View {")
                TextView(str: "        content")
                TextView(str: "            .overlay(")
                TextView(str: "                GeometryReader{proxy -> Color in")
                TextView(str: "                    let frame = proxy.frame(in: .global)")
            }
            Group{
                TextView(str: "                    DispatchQueue.main.async {")
                Text("                        //based on anchor point getting offset...")
                    .foregroundColor(.gray)
                TextView(str: "                        switch anchorPoint {...}")
            }
        }
    }
    }
}

@available(iOS 15.0, *)
struct SliderText_Previews: PreviewProvider {
    static var previews: some View {
        SliderText()
.previewInterfaceOrientation(.landscapeLeft)


    }
}


