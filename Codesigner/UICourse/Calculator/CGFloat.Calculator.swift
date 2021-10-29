//
//  CGFloat.Calculator.swift
//  Calculator
//
//  Created by florrie on 2021/10/23.
//

import UIKit

extension CGFloat {
    
    /// 屏幕宽高取 max
    static let screenMaxSize: CGFloat = Swift.max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    
    /// 屏幕宽高取 min
    static let screemMinSize: CGFloat = Swift.min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    
    /// 为 UISplitViewController 等宽设计
    static let splitPrimaryMin: CGFloat = floor(screenMaxSize / 2 - 0.5)
    
    /// 为 UISplitViewController 等宽设计
    static let splitPrimaryMax: CGFloat = screenMaxSize - splitPrimaryMin
    
    /// 针对 12.9 寸的比率 ()
    static let scaleMin: CGFloat = screemMinSize / 1024
}
