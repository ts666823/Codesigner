//
//  CalculatorButton.swift
//  SwiftUIDemo
//
//  Created by admin on 2021/10/15.
//  Copyright © 2021 Lee. All rights reserved.
//

import SwiftUI

//按钮结构体
extension Color {
    public static let lightGray = Color(red:0.6,green: 0.6,blue:0.6)
    public static let darkGray = Color(red:0.2,green: 0.2,blue:0.2)
}

class CalculatorButton: Identifiable {
    
    let id = UUID()
    let title: String
    @Published var isHidden: Bool = false
    var color: Color
    
    init(title: String, color: Color = Color(red: 0.2, green: 0.2, blue: 0.2)) {
        self.title = title
        self.color = color
    }
}
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
