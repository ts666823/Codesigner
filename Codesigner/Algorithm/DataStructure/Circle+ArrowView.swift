//
//  Circle+ArrowView.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/21.
//

import UIKit

class CircleView: UIView {
    var label:UILabel
    
    override init(frame: CGRect) {
        let size: CGSize = CGSize(width: frame.width, height: frame.width)
        let origin: CGPoint = CGPoint(x: 0, y: 0)
        self.label = UILabel(frame: CGRect(origin: origin, size: size))
        self.label.textAlignment = .center
        self.label.text = "0"
        super.init(frame: frame)
        self.addSubview(label)
        self.frame = frame
    }
    
    override func layoutSubviews() {
        let y: CGFloat = (self.superview?.frame.height)! - frame.height
        self.frame = frame
        self.frame.origin.y = y
        let color = UIColor(hue: y, saturation: 1, brightness: 1, alpha: 0.5)
        self.layer.cornerRadius = self.frame.height/2
        self.backgroundColor = color
    }
    
    func updateText(int4Text:Int){
        label.text = int4Text.description
        let color = UIColor(hue: CGFloat(int4Text)*10, saturation: 1, brightness: 1, alpha: 0.5)
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


