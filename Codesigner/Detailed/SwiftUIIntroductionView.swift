//
//  IntroductionView.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/15.
//

import SwiftUI

@available(iOS 15.0, *)
struct SwiftUIIntroductionView: View {

    @State private var showButtonView = false
    @State private var isAlert = false
    @Binding public var SwiftUidata:SwiftUICourse
    
    let primaryButton = Alert.Button.default(Text("OK")) {
            print("Yes, I'm a student.") //当用户点击该按钮时，在控制台输出一条日志
        }
        
        var alert: Alert {
            Alert(title: Text("Warning"),
                  message: Text("This is only available on iOS 15"),
                  dismissButton: primaryButton)
        }

    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    GeometryReader{ geometryProxy in
                        VStack{
                        Image(SwiftUidata.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth:.infinity)
                            .background(Color.black.opacity(0.5))
                            .blur(radius:20)
                            .opacity(0.2)
                            .ignoresSafeArea()
                        }
                    }
                    VStack{
                        Spacer()
                        HStack {

                            Text(SwiftUidata.title)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .padding(.leading)
                                .foregroundColor(Color("background3"))
//                                .padding(.leading,-180)
                            Spacer()
                            Button(action:{
                                self.showButtonView = true
                            }){
                                Text("Start Learn")
                                    .foregroundColor(Color("background3"))
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .frame(width: 114,height: 40)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color("background3"),lineWidth: 5))
                                    .cornerRadius(8)
                            }.padding(.trailing)
                             .fullScreenCover(isPresented: $showButtonView, content: {
                                switch SwiftUidata.id{
                                    case 1:SliderContentView()
                                    case 2:swipeActionView()
                                    case 3:safeAreaView()
                                    case 4:ContentView2()
                                    case 5:newTecView()
                                    default:
                                        swipeActionView()
                                }
                                })
                                

                        }
                    }
                    .padding(.bottom,30)
                }
                GeometryReader { geometryProxy in
                            VStack(alignment: .leading) {
                                Text("Brief Introduction")
                                    .font(.system(size: 30))
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                Text(SwiftUidata.introduction)
                                    .font(.system(size: 30))
                                    .padding(.leading)
                            }
                            .frame(
                                maxWidth: geometryProxy.size.width,
                                maxHeight: geometryProxy.size.height,
                                alignment: .topLeading
                            )
                        }
                
            }
            .alert(isPresented: $isAlert, content: {
                alert
            })
        }.cornerRadius(10)
        
    }
}

