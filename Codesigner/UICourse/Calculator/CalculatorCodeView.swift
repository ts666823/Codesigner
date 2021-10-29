//
//  CalculatorCodeView.swift
//  Calculator
//
//  Created by florrie on 2021/10/23.
//

import SwiftUI

struct CalculatorCodeView: UIViewRepresentable {
    
    typealias UIViewType = UITextView
    
    @EnvironmentObject var data: CalculatorData
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 25.0)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<CalculatorCodeView>) {
        uiView.text = data.code
    }
}

//struct CalculatorCodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorCodeView(text: "文本")
//    }
//}
