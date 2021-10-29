//
//  IntroductionView.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/15.
//

import SwiftUI

@available(iOS 15.0, *)
struct AlgorithmIntroductionView: View {
    @State private var showButtonView = false
    @State private var isAlert = false
    @Binding public var algorithm:AlgorithmData
    
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
                        Image(algorithm.imageName)
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
                            Text(algorithm.title)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .padding(.leading)
                                .foregroundColor(Color("background4"))
                            Spacer()
                            Button(action:{
                                self.showButtonView = true
                            }){
                                Text("Start Learn")
                                    .foregroundColor(Color("background4"))
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .frame(width: 114,height: 40)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("background4"),lineWidth: 5))
                                    .cornerRadius(10)
                            }.padding(.trailing)
                                .fullScreenCover(isPresented: $showButtonView, content: {
                                    SortSwiftUIView(algorithmData: algorithm).navigationBarBackButtonHidden(false)
                                })
                                

                        }
                    }
                    .padding(.bottom,30)
                }
                GeometryReader { geometryProxy in
                    VStack(alignment: .leading) {
                        Text(algorithm.content)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(.leading)
                        ScrollView{
                        Text(algorithm.introduction)
                            .font(.system(size: 30))
                            .padding(.leading)
                        }
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
        
    }
}

@available(iOS 15.0, *)
struct AlgorithmIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        AlgorithmIntroductionView(algorithm: .constant(AlgorithmData(imageName: "sorting", title: "冒泡排序", content: "最简单的排序", introduction: "冒泡排序（BubbleSort），是一种计算机科学领域的较简单的排序算法。\n它重复地走访过要排序的元素列，依次比较两个相邻的元素，如果顺序（如从大到小、首字母从Z到A）错误就把他们交换过来。走访元素的工作是重复地进行直到没有相邻元素需要交换，也就是说该元素列已经排序完成。\n这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端（升序或降序排列），就如同碳酸饮料中二氧化碳的气泡最终会上浮到顶端一样，故名“冒泡排序”。",rawValue: 0)) )
.previewInterfaceOrientation(.landscapeLeft)
    }
}

