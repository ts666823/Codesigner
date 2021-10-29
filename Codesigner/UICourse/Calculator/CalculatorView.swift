//
//  CalculatorView.swift
//  Calculator
//
//  Created by florrie on 2021/10/23.
//

import SwiftUI
import Foundation

struct CalculatorView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UISplitViewController

    private var data = CalculatorData()
    
    let dismiss: () -> Void
    
    init(dismiss: @escaping () -> Void) {
        self.dismiss = dismiss
    }
    
    func makeUIViewController(context: Context) -> UISplitViewController {
        
        let masterView = CalculatorMasterView()
            .environmentObject(data)
        
        let canvas = CalculatorPad()
            .environmentObject(data)
            
        let split = UISplitViewController(style: .doubleColumn)
        split.setViewController(UIHostingController(rootView: masterView), for: .primary)
        split.setViewController(UIHostingController(rootView: canvas), for: .secondary)
        split.primaryEdge = .trailing
        split.minimumPrimaryColumnWidth = .splitPrimaryMin
        split.maximumPrimaryColumnWidth = .splitPrimaryMax
        
        let button = CustomButton(type: .system)
        button.frame = CGRect(x: 10, y: 5, width: 90, height: 40)
        button.setTitle("☜GoBack", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 8.0
        button.addActionBlock(block: dismiss)
        split.view.addSubview(button)
        return split
    }
    
    func updateUIViewController(_ uiViewController: UISplitViewController, context: Context) {
        
    }
    
    
}

struct CalculatorMasterView: View {

    var body: some View {
        VStack {
            CalculatorInspectView()
            CalculatorCodeView()
        }
    }
}

fileprivate class CustomButton: UIButton {
    
    private var actionBlock: (() -> Void)?
    
    func addActionBlock(block: @escaping () -> Void) {
        addTarget(self, action: #selector(_action), for: .touchUpInside)
        actionBlock = block
    }
    
    @objc private func _action() {
        actionBlock?()
    }
}
