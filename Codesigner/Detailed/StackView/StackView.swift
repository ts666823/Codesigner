//
//  StackView.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/16.
//

import SwiftUI


struct StackView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showPushNode = false;
    @State var showPush = false;
    @State var pushNodeTurnRight = false;
    @State var pushNodeTurnDown = false;
    
    
    
    @State var showPopNode = false;
    @State var showPop = false;
    @State var popNodeTurnRight = false;
    @State var popNodeTurnDown = false;
    
    @State var showPeek = false;
    
    @State var stackNum = 0;
    
    @State private var dragAmount = CGSize.zero
    
    let spacing = screen.size.height/70
    let nodeWidth = screen.size.width/10
    let nodeHeight = screen.size.height / 30
    
    func getDownSpacing() -> CGFloat{
        let downSpacing = CGFloat(stackNum + 1) * spacing - (CGFloat(stackNum) * nodeHeight)
        return downSpacing
    }
    
    
    var body: some View {
        VStack {
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
            HStack{
                VStack {
                    HStack(alignment:.bottom,spacing:0){
                        
                        StackNode(width: nodeWidth)
                            .offset(x: -nodeWidth)
                            .opacity(showPushNode ? 1 : 0)
                            .offset(y:showPush ? -(screen.size.height / 2 + spacing + 5) : 0)
                            .offset(x:pushNodeTurnRight ? 2 * nodeWidth + 5 : 0)
                            .offset(y:pushNodeTurnDown ? (screen.size.height / 2 - CGFloat(stackNum) * (spacing + nodeHeight)) : 0)
                            
        //                    .offset(dragAmount)
        //
        //                    .gesture(DragGesture()
        //                                .onChanged { self.dragAmount = $0.translation }
        //                                .onEnded { _ in
        //                                    self.dragAmount = .zero
        //                                    self.showPush.toggle()
        //                                })
                        
                        ContainerBoarder()
                        
                        VStack(spacing:screen.size.height/70){
                            
                            StackNode(width: screen.size.width/10)
                                .opacity(stackNum > 6 ? 1 : 0)
                                .offset(y: (showPop&&stackNum == 7) ? -screen.size.height / 10 : 0)
                                .offset(x: (popNodeTurnRight&&stackNum == 7) ? 2 * nodeWidth + 5 : 0)
                                .offset(y: (popNodeTurnDown&&stackNum == 7) ? screen.size.height / 2 - 3 * nodeHeight + 5 : 0)
                                .opacity((showPopNode&&stackNum == 7) ? 0 : 1)
                            
                            StackNode(width: screen.size.width/10)
                                .opacity(stackNum > 5 ? 1 : 0)
                                .offset(y: (showPop&&stackNum == 6) ? -(screen.size.height / 10 + nodeHeight + spacing) : 0)
                                .offset(x: (popNodeTurnRight&&stackNum == 6) ? 2 * nodeWidth + 5 : 0)
                                .offset(y:(popNodeTurnDown&&stackNum == 6) ? screen.size.height / 2 - 3 * nodeHeight + 5 : 0)
                                .opacity((showPopNode&&stackNum == 6) ? 0 : 1)
                            
                            StackNode(width: screen.size.width/10)
                                .opacity(stackNum > 4 ? 1 : 0)
                                .offset(y:(showPop&&stackNum == 5) ? -(screen.size.height / 10 + 2 * (nodeHeight + spacing)) : 0)
                                .offset(x:(popNodeTurnRight&&stackNum == 5) ? 2 * nodeWidth + 5 : 0)
                                .offset(y:(popNodeTurnDown&&stackNum == 5) ? (screen.size.height / 2 - 3 * nodeHeight + 5) : 0)
                                .opacity((showPopNode&&stackNum == 5) ? 0 : 1 )
                                
                            StackNode(width: screen.size.width/10)
                                .opacity(stackNum > 3 ? 1 : 0)
                                .offset(y:(showPop&&stackNum == 4) ?  -(screen.size.height / 10 + 3 * (nodeHeight + spacing)) : 0)
                                .offset(x:(popNodeTurnRight&&stackNum == 4) ? 2 * nodeWidth + 5 : 0)
                                .offset(y: (popNodeTurnDown&&stackNum == 4) ? screen.size.height / 2 - 3 * nodeHeight + 5 : 0)
                                .opacity((showPopNode&&stackNum == 5) ? 0 : 1)
                            
                            StackNode(width: screen.size.width/10)
                                .opacity(stackNum > 2 ? 1 : 0)
                                .offset(y: (showPop&&stackNum == 3) ? -(screen.size.height / 10 + 4 * (nodeHeight + spacing)) : 0)
                                .offset(x: (popNodeTurnRight&&stackNum == 3) ? 2 * nodeWidth + 5 : 0 )
                                .offset(y:  (popNodeTurnDown&&stackNum == 3) ?  screen.size.height / 2 - 3 * nodeHeight + 5 : 0)
                                .opacity( (showPopNode&&stackNum == 3) ? 0 : 1)
                            
                            StackNode(width: screen.size.width/10)
                                .opacity(stackNum > 1 ? 1 : 0)
                                .offset(y:  (showPop&&stackNum == 2) ? -(screen.size.height / 10 + 5 * (nodeHeight + spacing)) : 0)
                                .offset(x:  (popNodeTurnRight&&stackNum == 2) ? 2 * nodeWidth + 5  : 0)
                                .offset(y:  (popNodeTurnDown&&stackNum == 2) ? screen.size.height / 2 - 3 * nodeHeight + 5 : 0)
                                .opacity((showPopNode&&stackNum == 2) ? 0 : 1)
                            
                            StackNode(width: screen.size.width/10)
                                .opacity(stackNum > 0 ? 1 : 0)
                                .offset(y: (showPop&&stackNum == 1) ? -(screen.size.height / 10 + 6 * (nodeHeight + spacing)) : 0)
                                .offset(x: (popNodeTurnRight&&stackNum == 1) ? 2 * nodeWidth + 5 : 0)
                                .offset(y:(popNodeTurnDown&&stackNum == 1) ?  screen.size.height / 2 - 3 * nodeHeight + 5 : 0)
                                .opacity((showPopNode&&stackNum == 1) ? 0 : 1)
                                
                            
                            Rectangle()
                                .frame(width: screen.size.width/10, height: 5)
                                .opacity(0.1)
                            .cornerRadius(3.0)
                            
                            
                        }
                        ContainerBoarder()
                        
                        StackNode(width: nodeWidth)
                            .offset(x: nodeWidth)
                            .opacity(0)
                        
                        
                    }
                    .frame(width: 2*screen.size.width/3)
                    
                    VStack {
                        Text("Stack")
                            .font(.title)
                        Text("The number of elements in the stack is \(stackNum)")
                            .font(.title2)
                    }
                }
                
                
                
                Divider()
                VStack{
                    Button(action: {
                        withAnimation(.easeInOut(duration: 1)){
                            self.showPushNode.toggle()
                        }
                        withAnimation(.easeInOut(duration: 1).delay(1)){
                            self.showPush.toggle()
                        }
                        withAnimation(.easeInOut(duration: 1).delay(2)){
                            self.pushNodeTurnRight.toggle()
                        }
                        withAnimation(.easeInOut(duration: 1).delay(3))
                        {
                            self.pushNodeTurnDown.toggle()
                        }
                        withAnimation(.linear(duration: 0.1).delay(4))
                        {
                            
                            self.showPushNode.toggle()
                            
                        }
                        withAnimation(.linear(duration: 0.1).delay(4.1))
                        {
                            
                            self.stackNum += 1
                            
                        }
                        withAnimation(.linear(duration: 0.001).delay(4.3))
                        {
                            self.pushNodeTurnRight.toggle()
                            self.pushNodeTurnDown.toggle()
                            self.showPush.toggle()
                        }
                    }) {
                        Text("Push Node")
                    }
                    
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 1)){
                            self.showPop.toggle()
                        }
                        withAnimation(.easeInOut(duration: 1).delay(1)){
                            self.popNodeTurnRight.toggle()
                        }
                        withAnimation(.easeInOut(duration: 1).delay(2)){
                            self.popNodeTurnDown.toggle()
                        }
                        withAnimation(.easeInOut(duration: 1).delay(3)){
                            self.showPopNode.toggle()
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(4)){
                            self.showPop.toggle()
                            self.popNodeTurnRight.toggle()
                            self.popNodeTurnDown.toggle()
                            self.showPopNode.toggle()
                            self.stackNum -= 1
                        }
                    }) {
                        Text("Pop Node")
                    }
                    Button(action: {
                        self.showPop.toggle()
                    }) {
                        Text("Peek Node")
                    }
                }
                .frame(width: screen.size.width/3)
            }
        }
    }
}

struct StackView_Previews:PreviewProvider{
    static var previews: some View{
        if #available(iOS 15.0, *) {
            StackView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            StackView()
            // Fallback on earlier versions
        }
    }
}



struct StackNode: View {
    @State var showPushNode = false;
    @State var showPush = false;
    @State var turnRight = false;
    @State var turnDown = false;
    
    
    var width = 200.0
    var body: some View {
        ZStack {
            Text("1")
            Rectangle()
                .frame(width: width, height: screen.size.height / 30)
                .cornerRadius(3.0)
                .opacity(0.1)
        }

    }
}

struct ContainerBoarder: View {
    var body: some View {
        Rectangle()
            .frame(width: 5, height: 7 * screen.size.height / 30 + screen.size.height / 10 + 5)
            .cornerRadius(3.0)
            .opacity(0.1)
    }
}
