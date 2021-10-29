//
//  CustomImageView.swift
//  UIDesign
//
//  Created by florrie on 2021/7/22.
//  
//

import UIKit
import SVGKit

class CustomImageView: UIImageView {
    
    public let source: CollectionResource
    
    // MARK: Init
    
    init(source: CollectionResource) {
        self.source = source
        super.init(frame: .zero)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: UI
    
    func setupUI() {
        tintColor = .black
        // 开启交互
        isUserInteractionEnabled = true
        // 拖拽手势 (拖拽移动)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panAction))
        addGestureRecognizer(pan)
        // 点击手势 (唤起属性面板)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        addGestureRecognizer(tap)
    }
    // MARK: Action
    
    // 记录上次回调滑动位置信息
    private var prevPosition: CGPoint = .zero
    
    // 拖拽事件响应
    // - Parameter pan: 拖拽手势对象
    @objc func panAction(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            // 记录初始点击位置
            prevPosition = pan.location(in: superview)
        case .changed:
            // 通过当前位置计算移动距离, 设置视图的位置达到移动效果
            let postion = pan.location(in: superview)
            center = CGPoint(x: center.x + postion.x - prevPosition.x,
                             y: center.y + postion.y - prevPosition.y)
            // 记录本次位置作为下次计算使用
            prevPosition = postion
        default: break
        }
    }
    
    
    // 点击事件响应
    @objc func tapAction() {
        // 发送通知, 在 CanvasViewController 中处理相关数据
        NotificationCenter.default.post(name: .ItemSelected, object: self)
    }
}

extension Notification.Name {
    
    static let ItemSelected = Notification.Name(rawValue: "ItemSelected")
}
