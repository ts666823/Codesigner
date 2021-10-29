//
//  UIViewExtension.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/9.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadiusScale: CGFloat {
        get {
            return frame.height/layer.cornerRadius
        }
        set {
            layer.cornerRadius = frame.height/newValue
        }
    }    
    
    /// 设置阴影
    /// - Parameters:
    ///   - color: 阴影颜色
    ///   - offset: 阴影偏移量
    ///   - opacity: 阴影透明度
    ///   - radius: 阴影半径
    func addShadow(color: UIColor, offset:CGSize, opacity:Float) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = self.frame.height/8
    }
}

