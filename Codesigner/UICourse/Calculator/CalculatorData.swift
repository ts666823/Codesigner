//
//  CalculatorData.swift
//  Calculator
//
//  Created by florrie on 2021/10/24.
//

import SwiftUI
import Combine

class CalculatorData: ObservableObject {
    
    @Published var selectedKeys: [String] = []
    
    @Published var code: String = ""
    
    let row1Butttons: [CalculatorButton] = [
        CalculatorButton(title: "AC",color: Color.lightGray),
        CalculatorButton(title: "±",color: Color.lightGray),
        CalculatorButton(title: "()",color: Color.lightGray),
        CalculatorButton(title: "÷", color: Color.orange)
    ]
    let row2Buttons: [CalculatorButton] = [
        CalculatorButton(title: "7"),
        CalculatorButton(title: "8"),
        CalculatorButton(title: "9"),
        CalculatorButton(title: "×", color: Color.orange)
    ]
    let row3Buttons: [CalculatorButton] = [
        CalculatorButton(title: "4"),
        CalculatorButton(title: "5"),
        CalculatorButton(title: "6"),
        CalculatorButton(title: "-", color: Color.orange)
    ]
    let row4Buttons: [CalculatorButton] = [
        CalculatorButton(title: "1"),
        CalculatorButton(title: "2"),
        CalculatorButton(title: "3"),
        CalculatorButton(title: "+", color: Color.orange)
    ]

    let row5Buttons: [CalculatorButton] = [
        CalculatorButton(title: "0"),
        CalculatorButton(title: "."),
        CalculatorButton(title: "=", color: Color.orange)
    ]
    
    private var dispose = Set<AnyCancellable>()
    
    private let size: CGFloat = (390.0 - 3 * 12.0) / 5.0
    
    let spacing: CGFloat = 12
    
    init() {
        $selectedKeys
            .sink { [weak self] keys in
                self?.code(keys: keys)
                
                
            }
            .store(in: &dispose)
    }
    
    private func code(keys: [String]) {
        /// 首部代码
        var code =
        """
        
          VStack {
              VStack(alignment: .center, spacing: 12.0) {
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
              }
        """
        
        /// 遍历行, 拼接代码
        [row1Butttons, row2Buttons, row3Buttons, row4Buttons, row5Buttons].forEach { row in
            /// 取本行按钮 title 和 当前选中的按钮 title 的交集
            let intersections = Set(row.map(\.title)).intersection(Set(keys))
            /// 如果本行有显示的按钮, 则拼接本行代码
            if intersections.count > 0 {
                code += """
                \n
                      HStack {
                """
                
                /// 查找已经显示的按钮
                row.filter {
                    intersections.contains($0.title)
                }
                .forEach { button in
                    /// 拼接按钮代码
                    code += """
                            \n
                              Button(action: {}) {
                                  Text("\(button.title)")
                                      .font(.system(size: 28))
                                      .foregroundColor(.white)
                                      .frame(width: \(button.title == "0" ? size * 2 + 12 : size), height: \(size))
                                      .background(\(button.color.name))
                                      .cornerRadius(\(size))
                              }\n
                    """
                }
                code += """
                      }\n
                """
            }
        }
        /// 尾部闭合括号代码
        code += """
          }
        """
        self.code = code
    }
}


fileprivate extension Color {
    
    
    var name: String {
        if self == .orange {
            return ".orange"
        } else if self == .darkGray {
            return "Color.darkGray"
        } else if self == .lightGray {
            return "Color.lightGray"
        }
        return ""
    }
    
}
