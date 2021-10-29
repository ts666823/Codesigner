//
//  2021newTecText.swift
//  myspace
//
//  Created by admin on 2021/10/3.
//

import SwiftUI

struct newTecTextView: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading, spacing: 5){
            Group{
                Text("Code:")
                    .font(.title)
                    .foregroundColor(.black)
                Divider()
                    .border(Color.white, width: 5)
                
                Text("//Custom UiHostingController for halfSheet...")
                    .foregroundColor(.gray)
                TextView(str: "class CustomHostingController<Content:View>:UIHostingController<Content>{")
                TextView(str: "     override func viewDidLoad() {")
                TextView(str: "         view.backgroundColor = .clear")
                Text("         //setting presentation controller properties")
                    .foregroundColor(.gray)
                TextView(str: "         if let presentationController = presentationController as?")
                TextView(str: "             UISheetPresentationController{")
                TextView(str: "          presentationController.detents = [.medium(),.large()]")
            }
            Group{
                Text("          //to show grab protion")
                    .foregroundColor(.gray)
                TextView(str:          "presentationController.prefersGrabberVisible = true } } }")
                Divider()
                    .border(Color.white, width: 5)
                TextView(str: "extension View{")
                TextView(str: "     func halfSheet<SheetView: View>(showSheet: Binding<Bool>,@ViewBuilder")
                TextView(str: "         sheetView:@escaping ()->SheetView,onEnd: @escaping ()->())->some View{")
                TextView(str: "         return self")
                TextView(str: "         .background(")
                TextView(str: "             HalfSheetHelper(onEnd: onEnd, sheetView: sheetView(), showSheet: showSheet)) } }")
            }
        }
    }
    }
}

@available(iOS 15.0, *)
struct newTecText_Previews: PreviewProvider {
    static var previews: some View {
        newTecTextView()
.previewInterfaceOrientation(.landscapeLeft)


    }
}

