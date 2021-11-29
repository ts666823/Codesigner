//
//  Calculator.swift
//  SwiftUIDemo
//
//  Created by admin on 2021/10/15.
//  Copyright © 2021 Lee. All rights reserved.
//

import SwiftUI


class Modal: ObservableObject{
    @Published var display = "0"
    var kuoHao = 0//记录左右括号出现的次数
    var done = false//记录是否输入等号，结束运算
    
    func prio(op:String)->Int {                 //给运算符优先级排序
        var priority = 0
        if (op == "*" || op == "/"){
            priority = 2
        }
        if (op == "+" || op == "-"){
            priority = 1
        }
        if (op == "("){
            priority = 0
        }
        return priority
    }
    
    func computeExpress(returnStr:Array<String>)->Float{//计算后缀表达式
        let s = Stack()
        var i = 0
        while(i < returnStr.count ) {
                    var t = returnStr[i]
                    if(t >= "0" && t <= "9" ) {
                        //数字直接入栈
                        s.push(element: Float(t) as AnyObject)
                    }else {
                        var a = 0.0,b = 0.0
                        a = s.pop() as! Double
                        b = s.pop() as! Double
                        switch(t){
                            case "*" : s.push(element:(b * a)as AnyObject)
                                break
                            case "/" : s.push(element:(b / a)as AnyObject)
                                break
                            case "+" : s.push(element:(b + a)as AnyObject)
                                break
                            case "-" : s.push(element:(b - a)as AnyObject)
                                break
//                            case "%" : stack.push(b % a);break;
                            default:
                                break
                        }
                    }
                    i += 1
                }
        return s.pop() as! Float
    }
    func translateExpress()->Array<String>{//中缀转后缀表达式
        let str = display.ConverCalculateChar()//输入值
        var returnStr = [String]()//返回值
        let s = Stack()
        var i = 0
        while (i<str.count-1){
            if((str[i]) >= "0" && (str[i]) <= "9"){//如果是数字，直接入栈
//                print(str[i])
                returnStr.append(str[i])
                print("shuzi")
            }
            else{//否则不是数字
                if(s.isEmpty()){//栈空则入站
                    s.push(element: str[i] as AnyObject)
                }
                else if(str[i] == "("){//左括号入栈
                    s.push(element: str[i] as AnyObject)
                }
                else if(str[i] == ")"){//如果是右括号，只要栈顶不是左括号，就弹出并输出
                    while((s.peek() as! String) != "("){
                        returnStr.append((s.peek() as! String))
                        print(s.pop() as Any)
                    }
                    print(s.pop() as Any)//弹出左括号，但不输出
                }
                else{
                    while(prio(op: str[i]) <= prio(op: (s.peek() as! String))){
                        //栈顶优先级大于等于当前运算符，则输出
                        returnStr.append((s.peek() as! String))
                        print(s.pop() as Any)
                        if(s.isEmpty()){//栈为空，停止
                            break
                        }
                    }
                    print(i)
//                    print(str[i])
//                    print(str[i] as AnyObject)
                    s.push(element: str[i] as AnyObject) //把当前运算符入栈
                }
            }
            i += 1
        }
        while(!s.isEmpty()){//最后，如果栈不空，则弹出所有元素并输出
            returnStr.append((s.peek() as! String))
            print(s.pop() as Any)
        }
        return returnStr
    }
    //按钮点击事件
    func buttonTapped(button: CalculatorButton){
        if display == "0" || done == true{
            display = ""
            done = false
        }
        if (button.title == "()") && (kuoHao%2 == 0){
            display = display + "("
            kuoHao += 1
        }else if (button.title == "()") && (kuoHao%2 == 1){
            display = display + ")"
            kuoHao += 1
        }else if(button.title == "="){
            
        }
        else{
            display = display + button.title
        }
        
        if button.title == "="{
            print(display)
            print(display.ConverCalculateChar())
            let returnStr = translateExpress()
            print(returnStr)
            print(returnStr.count)
            let result = computeExpress(returnStr: returnStr)
            display = String(result)
            done = true
            kuoHao = 0
        }
    }
}

struct FunctionalCalculator: View {
    //显示值
    @ObservedObject var vm = Modal()
    //处理特殊尺寸的按钮
    private func getButtonWidth(geometry:CGFloat,title:String)->CGFloat{
        return title != "0" ? (geometry-12*5)/4 : ((geometry-12*5)/4)*2+12
    }
    
    let spacing: CGFloat = 12
    var body: some View {
        GeometryReader{ geometry in
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
           
            VStack(alignment: .center, spacing: self.spacing){
                    Spacer()
                
                //显示器
                HStack{
                    Spacer()
                    Text(self.vm.display)
                        .font(.system(size:74))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                }.padding(.horizontal, 12)
                //以下每个HStack内都是一行数字，一共五行
                    HStack{
                        ForEach(row1Butttons){button in
                            Button(action: {self.vm.buttonTapped(button: button)}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: self.getButtonWidth(geometry: geometry.size.width, title: button.title), height: (geometry.size.width-self.spacing*5)/4)
                                    .background(button.color)
                                    .cornerRadius(100)
                            }
                        }
                    }

                    HStack{
                        ForEach(row2Buttons){button in
                            Button(action: {self.vm.buttonTapped(button: button)}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: self.getButtonWidth(geometry: geometry.size.width, title: button.title), height: (geometry.size.width-self.spacing*5)/4)
                                    .background(button.color)
                                    .cornerRadius(100)
                            }
                        }
                    }

                    HStack{
                        ForEach(row3Buttons){button in
                            Button(action: {self.vm.buttonTapped(button: button)}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: self.getButtonWidth(geometry: geometry.size.width, title: button.title), height: (geometry.size.width-self.spacing*5)/4)
                                    .background(button.color)
                                    .cornerRadius(100)
                            }
                        }
                    }
                    HStack{
                        ForEach(row4Buttons){button in
                            Button(action: {self.vm.buttonTapped(button: button)}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: self.getButtonWidth(geometry: geometry.size.width, title: button.title), height: (geometry.size.width-self.spacing*5)/4)
                                    .background(button.color)
                                    .cornerRadius(100)
                            }
                        }
                    }
                    HStack{
                        ForEach(row5Buttons){button in
                            Button(action: {self.vm.buttonTapped(button: button)}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: self.getButtonWidth(geometry: geometry.size.width, title: button.title), height: (geometry.size.width-self.spacing*5)/4)
                                    .background(button.color)
                                    .cornerRadius(100)
                            }
                        }
                    }

            }
            .background(Color.black)
        }
    }
    }
}

struct FunctionalCalculator_Previews: PreviewProvider {
    static var previews: some View {
        FunctionalCalculator()
    }
}



extension String {
 
    mutating func ConverCalculateChar() -> [String] {//将输入的数字、字符转为合法字符串
        var console = true //控制合成连续数字字符
        var SerialNumber = ""
        var strArr = [String]()
        self += "A" //临时帮助下循环正常进行
        for  char in self {
            switch char {
                case "0","1","2","3","4","5","6","7","8","9",".":
                    console == true ? (SerialNumber += String(char)) : (SerialNumber = String(char))
                console = true
            default:
               console = false
               if !SerialNumber.isEmpty {
                strArr.append(SerialNumber)
                SerialNumber = ""
                }
                strArr.append(String(char))
            }
        }
        strArr.removeLast() //删除刚刚的重要临时工"A"
        var index = 0
        for str in strArr {
            switch str {       //设定一定的容错性转换
                case "X", "x", "×":
                strArr[index] = "*"
                case "÷":
                strArr[index] = "/"
                case "（", "{", "[":
                strArr[index] = "("
                case "）", "}", "]":
                strArr[index] = ")"
            default:
                break
            }
           index += 1
        }
        return strArr
    }
    
}
