//
//  sortRect.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/12.
//

import UIKit
import SwiftUI

class SortView: UIView {
    var label:UILabel
    
    override init(frame: CGRect) {
        self.label = UILabel(frame: CGRect(x: 0,y: 0,width:frame.width ,height: frame.height))
        self.label.textAlignment = .center
        self.label.text = ""
        self.label.adjustsFontSizeToFitWidth = true
        super.init(frame: frame)
        self.addSubview(label)
        self.frame = frame
    }
    
    override func layoutSubviews() {
        let y: CGFloat = (self.superview?.frame.height)! - frame.height
        self.frame = frame
        self.frame.origin.y = y
        let weight = frame.height / (self.superview?.frame.height)!
        let color = UIColor(hue: weight, saturation: 1, brightness: 1, alpha: 0.3)
        let textColor = UIColor.black
        self.backgroundColor = color
        self.label.textColor = textColor
        self.label.text = Int(frame.height).description
    }
    
    func updateHeight(height: CGFloat) {
        self.frame.size.height = height
        self.label.frame.size.height = height
        self.label.text = Int(height).description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

