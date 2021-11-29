//
//  Introduction.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/20.
//

import Foundation
import SwiftUI

struct IntroductionView: View {
    @State private var showButtonView = false
    @State private var isAlert = false
    @Binding public var UIcourse: Course
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
                            Image(UIcourse.image)
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

                            Text(UIcourse.title)
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

                                if #available(iOS 15.0, *) {
                                    if UIcourse.title == "Move A Kit Yourself" {
                                        UIDesignView {
                                            self.showButtonView = false
                                        }
                                    }
                                    else if UIcourse.title == "Design the Calculator UI" {
                                        CalculatorView {
                                            self.showButtonView = false
                                        }
                                    }
                                    else if UIcourse.title == "Implement A Calculator By Stacks"{
                                        StackView()
                                        }
                                    else if UIcourse.title == "Create A Complete Calculator"{
                                           CalculatorHome()
                                    }
                                    }
                                    
                                else{
                                    // Fallback on earlier versions
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
                                Text(UIcourse.introduction)
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
        }
//        NavigationView{
//            VStack {
//                HStack {
//                    Text(title)
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .padding(.leading)
//                    Spacer()
//                }
//                Text("introducton")
//                    .font(.body)
//                if #available(iOS 15.0, *) {
////                    NavigationLink(destination: swipeActionView().navigationBarBackButtonHidden(true).navigationBarHidden(false), isActive: $showButtonView) { EmptyView() }
//                } else {
//
//                }
//                Button("点击按钮跳转页面") {
//                    self.showButtonView = true
//                }.fullScreenCover(isPresented: $showButtonView, content: {
//
//                    if #available(iOS 15.0, *) {
//                        if title == "Move A Kit" {
//                            UIDesignView {
//                                self.showButtonView = false
//                            }
//                        } else if title == "Build A Calculator Interface" {
//                            CalculatorView {
//                                self.showButtonView = false
//                            }
//                        } else {
//
//                        }
//                    } else {
//                        // Fallback on earlier versions
//                    }})
//            }
//            .alert(isPresented: $isAlert, content: {
//                alert
//            })
//
//        }
    }
}

