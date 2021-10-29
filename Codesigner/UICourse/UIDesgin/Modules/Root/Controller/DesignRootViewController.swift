//
//  RootViewController.swift
//  UIDesign
//
//  Created by florrie on 2021/9/24.
//  
//

import UIKit
import SwiftUI

struct UIDesignView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = DesignRootViewController
    
    private let dismiss: () -> Void
    
    init(dismiss: @escaping () -> Void) {
        self.dismiss = dismiss
    }
    
    func makeUIViewController(context: Context) -> DesignRootViewController {
        let vc = UIStoryboard(name: "UIDesignMain", bundle: nil).instantiateInitialViewController() as! DesignRootViewController
        vc.dismissBlock = dismiss
        return vc
    }
    
    func updateUIViewController(_ uiViewController: DesignRootViewController, context: Context) {
        
    }
}


class DesignRootViewController: UISplitViewController {
    
    private let button = UIButton()
    
    public var dismissBlock: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        minimumPrimaryColumnWidth = UIScreen.main.bounds.width * 0.4
        maximumPrimaryColumnWidth = UIScreen.main.bounds.width * 0.5
        
        
        button.frame = CGRect(x: 10, y: 5, width: 80, height: 40)
        button.setTitle("☜GoBack", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func dismissAction() {
        dismissBlock?()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        /// 设置 `ResCollectionPickController` 的 `delegate`
        let picker = viewController(.primary) as? ResCollectionPickController
        let canvas = viewController(.secondary) as? CanvasViewController
        picker?.delegate = canvas
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: view.safeAreaInsets.left + 15,
                              y: view.safeAreaInsets.top + 15,
                              width: 80,
                              height: 40)
        view.bringSubviewToFront(button)
    }
    
    // MARK: - Private
    
    ///  获取对应视图控制器 `root` 是 `UINavigationController`, 获取 `nav` 的 `栈底` 控制器
    /// - Parameter colum: colum
    /// - Returns: 控制器对象
    private func viewController(_ colum: Column) -> UIViewController? {
        let nav = viewController(for: colum) as? UINavigationController
        return nav?.viewControllers.first
    }
}
