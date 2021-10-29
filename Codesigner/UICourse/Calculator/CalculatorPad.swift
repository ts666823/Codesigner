//
//  Calculator.swift
//  SwiftUIDemo
//
//  Created by admin on 2021/10/15.
//  Copyright © 2021 Lee. All rights reserved.
//

import SwiftUI

struct CalculatorPad: View {
    
    private let size: CGFloat = (390.0 - 3 * 12.0) / 5.0 * CGFloat.scaleMin
    
    let spacing: CGFloat = 12 * CGFloat.scaleMin
    
    @EnvironmentObject var data: CalculatorData
    
    var body: some View {
        ZStack {
            
            VStack {
                VStack(alignment: .center, spacing: self.spacing) {
                    Spacer()
                    //显示器
                    HStack {
                        Spacer()
                        Text("0")
                            .font(.system(size:74))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.trailing)
                            .padding(.horizontal, 30)
                    }
                    .padding(.horizontal, 12)
                    
                    // 以下每个HStack内都是一行数字，一共五行
                    HStack {
                        ForEach(row1Butttons){ button in
                            Button(action: {
                         
                            }) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: size, height: size)
                                    .background(button.color)
                                    .cornerRadius(size)
                            }
                            .opacity(data.selectedKeys.contains(button.title) ? 1 : 0)
                        }
                    }

                    HStack {
                        ForEach(row2Buttons){ button in
                            Button(action: {}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: size, height: size)
                                    .background(button.color)
                                    .cornerRadius(size)
                            }
                            .opacity(data.selectedKeys.contains(button.title) ? 1 : 0)
                        }
                    }
    //
                    HStack {
                        ForEach(row3Buttons){button in
                            Button(action: {}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: size, height: size)
                                    .background(button.color)
                                    .cornerRadius(size)
                            }
                            .opacity(data.selectedKeys.contains(button.title) ? 1 : 0)
                        }
                    }
                    
                    HStack {
                        ForEach(row4Buttons){button in
                            Button(action: {}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: size, height: size)
                                    .background(button.color)
                                    .cornerRadius(size)
                            }
                            .opacity(data.selectedKeys.contains(button.title) ? 1 : 0)
                        }
                    }
                    HStack {
                        ForEach(row5Buttons){ button in
                            Button(action: {print(UIScreen.main.bounds)}) {
                                Text(button.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: button.title == "0" ? size * 2 + spacing : size, height: size)
                                    .background(button.color)
                                    .cornerRadius(size)
                            }
                            .opacity(data.selectedKeys.contains(button.title) ? 1 : 0)
                        }
                    }
                }
                .padding(.bottom, 30)
                .frame(width: 390, height: 884, alignment: .center)
                .background(Color.black)
                .scaleEffect(CGFloat.screemMinSize / (884.0 + 60))
                .offset(x: 0, y: -30)
            }
             
        }

    }
}

//struct Calculator_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorPad()
//    }
//}



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
