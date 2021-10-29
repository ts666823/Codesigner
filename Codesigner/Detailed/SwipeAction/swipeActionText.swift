//
//  swipeActionText.swift
//  myspace
//
//  Created by admin on 2021/10/6.
//

import SwiftUI
//@available(iOS 15.0, *)

@available(iOS 15.0, *)
struct swipeActionTextView:View{
    @Binding var swipeActionEffect: HorizontalEdge
    @State private var showingActionSheet = false
    @State private var effectText = "       .swipeActions(edge: .trailing, allowsFullSwipe: false){"
    var body: some View{
        VStack(alignment: .leading, spacing: 5){
            Group{
                Text("Code:")
                    .font(.title)
                    .foregroundColor(.black)
                Divider()
                    .border(Color.white, width: 5)
                
                TextView(str:"List{")
                TextView(str: "     ForEach(1...10,id:\\.self){index in")
                TextView(str: "     Text(\"Label \\(index)\"")
                Text("     //swipe Action...")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                Text("     //You can add more button as follow...")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                Text(effectText)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0/255, green: 138/255, blue: 138/255))
                    .onTapGesture {
                        self.showingActionSheet = true
                    }
                    .actionSheet(isPresented: $showingActionSheet){
                        ActionSheet(title: Text("Change effect"), message: Text("Select a new effect"), buttons: [
                            .default(Text(".trailing")){
                                self.effectText = "       .swipeActions(edge: .trailing, allowsFullSwipe: false){"
                                swipeActionEffect = HorizontalEdge.trailing
                            },
                            .default(Text(".leading")){
                                self.effectText = "       .swipeActions(edge: .leading, allowsFullSwipe: false){"
                                swipeActionEffect = HorizontalEdge.leading
                            },
                            .cancel()
                        ])
                    }
                
                
                
            }
            Group{
                TextView(str: "         Button{")
                TextView(str: "         }label:{")
                TextView(str: "             Image(systemName: \"house.fill\") }")
                TextView(str: "         .tint(.blue) } } }")
            }
            
        }
    }
}
@available(iOS 15.0, *)
struct swipeActionTextView_Previews:PreviewProvider{
    static var previews: some View{
        swipeActionTextView(swipeActionEffect: .constant(HorizontalEdge.trailing)).previewInterfaceOrientation(.landscapeLeft)
    }
}

