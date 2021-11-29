//
//  CalculatorCodeView.swift
//  Calculator
//
//  Created by florrie on 2021/10/23.
//

import SwiftUI

struct CalculatorCodeView: UIViewRepresentable {
    @EnvironmentObject var data: CalculatorData
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = UIColor(red: 0.8039, green: 0.82745, blue: 0.88235, alpha: 1.0)
        textView.layer.cornerRadius = 8.0
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 25.0)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<CalculatorCodeView>) {
        uiView.text = data.code
            //.background(Color(red: 0.8039, green: 0.82745, blue: 0.88235))
    }
}

/*
 func makeUIView(context: Context) -> UIScrollView {
     let scrollView = UIScrollView()
     let textView = UITextView()
     textView.isEditable = false
     textView.font = UIFont.systemFont(ofSize: 25.0)
     textView.text = data.code
     scrollView.addSubview(textView)
     return scrollView
 }
 
 func updateUIView(_ uiView: UIScrollView, context: UIViewRepresentableContext<CalculatorCodeView>) {
     var textView = UITextView()
     textView = uiView.subviews[0] as! UITextView
     textView.text = data.code
 */

//struct CalculatorCodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorCodeView(text: "文本")
//    }
//}
