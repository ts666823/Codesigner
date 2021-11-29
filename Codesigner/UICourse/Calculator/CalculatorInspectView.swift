//
//  CalculatorInspectView.swift
//  Calculator
//
//  Created by florrie on 2021/10/24.
//

import SwiftUI

struct CalculatorInspectView: View {
    
    private let size: CGFloat = (390.0 - 3 * 12.0) / 5.0 * CGFloat.scaleMin
    
    let keys: [[CalculatorButton]] = [
        [CalculatorButton(title: "1"),
         CalculatorButton(title: "2"),
         CalculatorButton(title: "3"),
         CalculatorButton(title: "4"),
         CalculatorButton(title: "5"),
         CalculatorButton(title: "6"),
         CalculatorButton(title: "7"),
         CalculatorButton(title: "8"),
          
        ],
        [CalculatorButton(title: "9"),
         CalculatorButton(title: "0"),
         CalculatorButton(title: "."),
         CalculatorButton(title: "+", color: Color.orange),
         CalculatorButton(title: "-", color: Color.orange),
         CalculatorButton(title: "×", color: Color.orange),
         CalculatorButton(title: "÷", color: Color.orange),
         CalculatorButton(title: "=", color: Color.orange),
         
        ],
        [
         CalculatorButton(title: "AC",color: Color.lightGray),
         CalculatorButton(title: "±",color: Color.lightGray),
         CalculatorButton(title: "()",color: Color.lightGray),
         CalculatorButton(title: "",color: Color.clear),
         CalculatorButton(title: "",color: Color.clear),
         CalculatorButton(title: "",color: Color.clear),
         CalculatorButton(title: "",color: Color.clear),
         CalculatorButton(title: "",color: Color.clear),
        ]
    ]
    
    
    
    let spacing: CGFloat = 12
    
    @EnvironmentObject var data: CalculatorData
    
    var body: some View {
        let bgcolor = Color(red: 0.8039, green: 0.82745, blue: 0.88235)
        ZStack{
            //Color(UIColor(red: 205, green: 211, blue: 225, alpha: 1)).ignoresSafeArea()
            bgcolor.ignoresSafeArea()
            VStack {
                ForEach(0..<keys.count) { index in
                    HStack {
                        ForEach(keys[index]) { key in
                            Button(action: {
    //                            if let index = data.selectedKeys.firstIndex(of: key.title) {
    //                                data.selectedKeys.remove(at: index)
    //                            } else {
    //                                data.selectedKeys.append(key.title)
    //                            }
                                if data.selectedKeys.contains(key.title) == false {
                                    data.selectedKeys.append(key.title)
                                }
                            }) {
                                Text(key.title)
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .frame(width: size, height: size)
                                    .background(key.color)
                                    .cornerRadius(size)
                            }
                        }
                    }
                }
            }
            //.background(Color(UIColor(red: 225, green: 211, blue: 225, alpha: 1)))

        }
        .cornerRadius(8.0)
        .padding(0)

    }

}
