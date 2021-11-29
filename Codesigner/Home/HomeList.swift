//
//  HomeList.swift
//  SwiftUIDemo
//
//  Created by Lee on 2019/9/26.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct HomeList: View {
    @State var chooseCourse: Course =  Course(
        title: "Move A Kit",
        image: "Illustration1",
        introduction: "asdadadasdasdsa",
        backgroundColor: Color("background3"),
        shadowColor: Color("shadow3")
    )
    @State var SwiftUIdata = SwiftUICourse.SwiftUICourseData[0]
    @State var showModel = false
    @State var showCalculator = false
    @State var showAlgorithm = false
    @State private var showButtonView = false
    @State var chooseAlgorithm = AlgorithmData(imageName: "sorting", title: "冒泡排序", content: "最简单的排序", introduction: "冒泡排序（BubbleSort），是一种计算机科学领域的较简单的排序算法。\n它重复地走访过要排序的元素列，依次比较两个相邻的元素，如果顺序（如从大到小、首字母从Z到A）错误就把他们交换过来。走访元素的工作是重复地进行直到没有相邻元素需要交换，也就是说该元素列已经排序完成。\n这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端（升序或降序排列），就如同碳酸饮料中二氧化碳的气泡最终会上浮到顶端一样，故名“冒泡排序”。",rawValue: 0)
    
    @ObservedObject var homeViewModel = HomeViewModel()
    
    @EnvironmentObject var certificateViewModel: CertificateViewModel
    @EnvironmentObject var store: UpdateStore
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Codesginer")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("Learn Swift")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
                .padding(.leading, 70)
                
                CertificateRows()
                    .environmentObject(certificateViewModel)
                
                HStack {
                    Text("What's New in SwiftUI")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                    .padding(.leading, 30)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(SwiftUICourse.SwiftUICourseData) { item in
                            Button(action: {
                                self.SwiftUIdata = item
                                self.showModel = true
                            }) {
                                GeometryReader { geometry in
                                    CourseView(
                                        title: item.title,
                                        image: item.imageName,
                                        backgroundColor: Color("background3"),
                                        shadowColor: Color("shadow3")
                                    )
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 40) / -40), axis: (x: 0, y: 10, z: 0))
                                }
                                .frame(width: 246, height: 360)
                            }.sheet(isPresented: self.$showModel) {
                                SwiftUIIntroductionView(SwiftUidata: $SwiftUIdata)
                            }
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
                
                HStack {
                    Text("Algorithm Course")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                    .padding(.leading, 30)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(homeViewModel.algorithmCourseData) { item in
                            Button(action: {
                                self.showAlgorithm = true
                                self.chooseAlgorithm = item
                            }) {
                                GeometryReader { geometry in
                                    CourseView(
                                        title: item.title,
                                        image: item.imageName,
                                        backgroundColor: Color("background4"),
                                        shadowColor: Color("shadow4")
                                    )
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 40) / -40), axis: (x: 0, y: 10, z: 0))
                                }
                                .frame(width: 246, height: 360)
                            }.sheet(isPresented: self.$showAlgorithm) {
                                AlgorithmIntroductionView(algorithm: $chooseAlgorithm)
                                    .environmentObject(certificateViewModel)
                                    .environmentObject(store)
                            }
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
                
                HStack {
                    Text("How to Build a Calculator")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                    .padding(.leading, 30)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(CourseData) { item in
                            Button(action: {
                                self.showCalculator = true
                                self.chooseCourse = item
                            }) {
                                GeometryReader { geometry in
                                    CourseView(
                                        title: item.title,
                                        image: item.image,
                                        backgroundColor: item.backgroundColor,
                                        shadowColor: item.shadowColor
                                    )
                                        .shadow(radius: 20)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 40) / -40), axis: (x: 0, y: 10, z: 0))
                                }
                                .frame(width: 246, height: 360)
                            }.sheet(isPresented: self.$showCalculator) {
                                IntroductionView(UIcourse: self.$chooseCourse)
                            }
                            
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
                
                NavigationLink(destination: ContentView(), isActive: $showButtonView) { EmptyView() }
                
            }
            .padding(.top, 40.0)
            .padding(.bottom, 83)
        }
        .blur(radius: showModel ? 20 : 0)
        .blur(radius: showAlgorithm ? 20 : 0)
        .blur(radius: showAlgorithm ? 20 : 0)
        .animation(.default)
    }
}

@available(iOS 15.0, *)
struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            HomeList()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            HomeList()
            // Fallback on earlier versions
        }
    }
}

struct CourseView: View {
    var title : String = "Build an app with SwiftUI"
    var image : String = "Illustration1"
    var backgroundColor: Color = Color("background3")
    var shadowColor : Color = Color("shadow3")
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(20)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: ContentMode.fit)
                .background(backgroundColor)
                .cornerRadius(10)
                .padding(.bottom, 80.0)
                .padding(.horizontal,20.0)
        }
        .background(backgroundColor)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title : String
    var image : String
    var introduction : String
    var backgroundColor: Color
    var shadowColor : Color
}
let CourseData = [
    Course(
        title: "Move A Kit Yourself",
        image: "CalCourse1",
        introduction: "In this section, you will learn how to move a kit and find the SwiftUI code in the inspection module. Take your first step in learning SwiftUI from here!",
        backgroundColor: Color("background2"),
        shadowColor: Color("shadow2")
    ),
    Course(
        title: "Design the Calculator UI",
        image: "CalCourse2",
        introduction: "Now you've becomed familiar with these SwiftUI objects, try to build a simple UI of calculator yourself!",
        backgroundColor: Color("background2"),
        shadowColor: Color("shadow2")
    ),
    Course(
        title: "Implement A Calculator By Stacks",
        image: "CalCourse3",
        introduction: "Congratulation on your building a calculator interface successfully! Do you want to further implement a calculator? This section about stack perhaps will give you a hint to realize that.",
        backgroundColor: Color("background2"),
        shadowColor: Color("shadow2")
    ),
    Course(
        title: "Create A Complete Calculator",
        image: "CalCourse4",
        introduction: "Now that you've learned everything you need to know, start building a fully functional calculator!",
        backgroundColor: Color("background2"),
        shadowColor: Color("shadow2")
    )
]



