//
//  safeareaText.swift
//  myspace
//
//  Created by admin on 2021/10/6.
//

import SwiftUI
@available(iOS 15.0, *)
struct safeAreaTextView:View{
    @Binding var safeareaEffect: VerticalEdge
    @State private var showingActionSheet = false
    @State private var effectText = ".safeAreaInset(edge: .bottom){"
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Group{
                Text("Code:")
                    .font(.title)
                    .foregroundColor(.black)
                Divider()
                    .border(Color.white, width: 5)
                
                TextView(str:"ScrollView{")
                TextView(str: "     VStack(spacing: 18){//Your Code Here}")
                TextView(str: "     .padding()}")

                Text(effectText)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0/255, green: 138/255, blue: 138/255))
                    .onTapGesture {
                        self.showingActionSheet = true
                    }
                    .actionSheet(isPresented: $showingActionSheet){
                        ActionSheet(title: Text("Change effect"), message: Text("Select a new effect"), buttons: [
                            .default(Text(".bottom")){
                                self.effectText = ".safeAreaInset(edge: .bottom){"
                                safeareaEffect = VerticalEdge.bottom
                            },
                            .default(Text(".top")){
                                self.effectText = ".safeAreaInset(edge: .top){"
                                safeareaEffect = VerticalEdge.top
                            },
                            .cancel()
                        ])
                    }
                TextView(str: "     Capsule()")
                TextView(str: "         .fill(Color.blue)")
                TextView(str: "         .frame(height: 60)")
                TextView(str: "         .padding(.horizontal) } } }")
            }
            
        }
    }
}
@available(iOS 15.0, *)
struct safeAreaTextView_Previews: PreviewProvider {
    static var previews: some View {
        safeAreaTextView(safeareaEffect: .constant(VerticalEdge.bottom))
.previewInterfaceOrientation(.landscapeLeft)
//            .previewLayout(.fixed(width: 670, height: 984))

    }
}
