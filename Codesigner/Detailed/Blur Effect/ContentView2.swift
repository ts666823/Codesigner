//
//  ContentView.swift
//  myspace
//
//  Created by admin on 2021/9/19.
//
import SwiftUI
@available(iOS 15.0, *)
class UserSettings: ObservableObject {
    
    @Published var blurEffect = Material.ultraThinMaterial
}
@available(iOS 15.0, *)
struct ContentView2: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var blurEffect = Material.ultraThinMaterial
    let pic = URL(string: "https://img1.baidu.com/it/u=3194664463,3828985472&fm=253&fmt=auto&app=120&f=JPEG?w=600&h=399")
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
            .padding(.top,-70)
        HStack{
       
            VStack{
                
                Text("BLUR EFFECT")
                    .font(.largeTitle)
                AsyncImage(url: pic,scale: 1.0){ phase in
                    if let image = phase.image{
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 400)
                            .cornerRadius(10)
                        //Blur Effects...
                        //AKA UIVisualEffect View...
                            .overlay(blurEffect,in:RoundedRectangle(cornerRadius: 10))
                    }
                    else{
                        Image(systemName:"house.fill")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                    }
                }
            }
            .padding()
            ContentView3(blurEffect2: $blurEffect)
        }
        }
    }
}


@available(iOS 15.0, *)
struct UI_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
.previewInterfaceOrientation(.landscapeLeft)
//            .previewLayout(.fixed(width: 670, height: 984))
            
    }
}


