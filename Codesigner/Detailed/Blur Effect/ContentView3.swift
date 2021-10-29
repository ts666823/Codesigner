//
//  ContentView.swift
//  myspace
//
//  Created by admin on 2021/9/19.
//
import SwiftUI

@available(iOS 15.0, *)
struct ContentView3: View {
    @Binding var blurEffect2: Material
    @State private var showingActionSheet = false
    @State private var effectText = "      .ultraThinMaterial"
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5){
            Group{
                Text("Code:")
                    .font(.title)
                    .foregroundColor(.black)
                Divider()
                    .border(Color.white, width: 5)
                
                TextView(str: "AsyncImage(url: pic,scale: 1.0){ phase in")
                TextView(str: "  if let image = phase.image{")
                TextView(str: "     image")
                TextView(str: "         .resizable()")
                TextView(str: "         .aspectRatio(contentMode: .fit)")
                TextView(str: "         .frame(width: 400, height: 400)")
                TextView(str: "         .cornerRadius(10)")
                TextView(str: "         .overlay(")
            }
            Group{
                VStack{
                Text(effectText)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0/255, green: 138/255, blue: 138/255))
                    .onTapGesture {
                        self.showingActionSheet = true
                    }
                    .actionSheet(isPresented: $showingActionSheet){
                        ActionSheet(title: Text("Change effect"), message: Text("Select a new effect"), buttons: [
                            .default(Text(".ultraThinMaterial")){
                                self.effectText = "      .ultraThinMaterial"
                                blurEffect2 = Material.ultraThinMaterial
                            },
                            .default(Text(".ultraThickMaterial")){
                                self.effectText = "      .ultraThickMaterial"
                                blurEffect2 = Material.ultraThickMaterial
                            },
                            .default(Text(".thinMaterial")){
                                self.effectText = "      .thinMaterial"
                                blurEffect2 = Material.thinMaterial
                            },
                            .default(Text(".thickMaterial")){
                                self.effectText = "      .thickMaterial"
                                blurEffect2 = Material.thickMaterial
                            },
                            .cancel()
                        ])
                    }

                }
                    
                TextView(str: "         ,in:RoundedRectangle(cornerRadius: 10))}")
                TextView(str: "  else{")
                TextView(str: "     Image(systemName:\"house.fill\"")
                TextView(str: "         .font(.largeTitle)")
                TextView(str: "         .foregroundColor(.yellow)}")
                TextView(str: " }")
            }
            
        }

    }

}

@available(iOS 15.0, *)
struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3(blurEffect2: .constant(Material.ultraThinMaterial))
            .previewLayout(.fixed(width: 670, height: 984))
    }
}

