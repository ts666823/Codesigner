//
//  ViewController.swift
//  UIDesign
//
//  Created by florrie on 2021/7/22.
//  
//

import UIKit
import SDWebImage
import SDWebImageSVGCoder
import SVGKit
//import "ResCollectionPickController.swift"

class CanvasViewController: UIViewController {
    // 顶部按钮，segment
    /*
    private let segmentControl = UISegmentedControl(items: [
        "Kit Garage",
        //"Design Box",
        "Code"
    ])
    */
    // 画布
    private let canvasView = CanvasView()
    // 属性
    private let inspectorView = AttributesInspectorView()
    // 代码
    let rect = CGRect(x: 100, y: 50, width: 100, height: 100)
    public var greenView = UIView(frame: CGRect(x: 100, y: 50, width: 100, height: 100))
    // kit
    private let kitGarageView = ResCollectionViewCell()
    // 图层数组
    private var layers: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
        
    private func setupUI() {
        view.backgroundColor = .white
        
        // 顶部按钮
        /*
        navigationItem.titleView = segmentControl
        segmentControl.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        segmentControl.selectedSegmentIndex = 1 //默认选中组件库
        segmentControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        */
        
        // 画布
        view.addSubview(canvasView)
        canvasView.backgroundColor = .rgb(0xf0, 0xf0, 0xf0)
        
        // 代码
//        view.addSubview(greenView)
//        greenView.backgroundColor = UIColor.green
//        greenView.addSubview(kitGarageView)
        //canvasView.
        
        //Garage
        //view.addSubview(layers)
        
        // 属性编辑面板
//        view.addSubview(inspectorView)
        
        let margin: CGFloat = 20.0
        let maxHeight = view.bounds.height - margin * 2 - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        inspectorView.frame = CGRect(x: view.bounds.width/2,
                                     //y: view.bounds.size.height - AttributesInspectorView.height - view.safeAreaInsets.bottom,
                                y: margin + view.safeAreaInsets.top,
                                width: view.bounds.width/2.5,
                                height: maxHeight)
        
        // 默认隐藏属性编辑面板(title是inspection)
        inspectorView.isHidden = true
        
        // 监听通知
        NotificationCenter.default.addObserver(forName: .ItemSelected, object: nil, queue: nil) { notf in
            guard let view = notf.object as? UIView else { return }
            self.displayViewAttribute(aview: view)
        }
    }
    
    // canvas边距
    private let margin: CGFloat = 20.0
    // 编辑subviews布局
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // canvas布局
        let maxWidth = view.bounds.width - margin * 2
        let maxHeight = view.bounds.height - margin * 2 - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        // canvas横纵比
        let ratio: CGFloat = 390.0 / 844.0
        var frameCanvas: CGRect = .zero
    
        // 画布保持为 iPhone 12 的比例 (390 * 844)
        // 宽度比例更大 (优先纵向布局, 横向加边距)
        if maxWidth / maxHeight > ratio {
            let width = maxHeight * ratio
            
            frameCanvas = CGRect(x: (view.bounds.width - width) / 2,
                           y: margin + view.safeAreaInsets.top,
                           width: width ,
                           height: maxHeight)
        }
        /*
        else {
            let height = maxWidth / ratio
            frameCanvas = CGRect(x: 200,
                           y: (maxHeight - height) / 2 + view.safeAreaInsets.top,
                           width: maxWidth,
                           height: height)
        }
        */
        canvasView.frame = frameCanvas
        
//        // 代码（绿色）面板布局
//        greenView.frame = CGRect(x: view.bounds.width/2,
//                                     //y: view.bounds.size.height - AttributesInspectorView.height - view.safeAreaInsets.bottom,
//                                y: margin + view.safeAreaInsets.top,
//                                width: view.bounds.width/2.5,
//                                height: maxHeight)
        
        
        /*
        // 属性面板布局
        inspectorView.frame = CGRect(x: 0,
                                     y: view.bounds.size.height - AttributesInspectorView.height - view.safeAreaInsets.bottom,
                                     width: view.bounds.width,
                                     height: AttributesInspectorView.height)
         */
    }
    
    // 控制segment
    @objc private func segmentAction(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0://kit garage
            let nav = UINavigationController(rootViewController: ResCollectionPickController(delegate: self))
            present(nav, animated: true, completion: nil)
        /*
        case 1:
            let nav = UINavigationController(rootViewController: AttributeInspectorViewController())
            present(nav, animated: true, completion: nil)
        */
        case 1://inspect & code
            let nav = UINavigationController(rootViewController: InspectViewController())
            present(nav, animated: true, completion: nil)
        default: break
        }
        //segment.selectedSegmentIndex = 0
    }
    
    private func displayViewAttribute(aview: UIView) {
        guard let view = aview as? CustomImageView, layers.contains(where: { $0 == view }) else {
            return
        }
        
        guard let nav = splitViewController?.viewController(for: .primary) as? UINavigationController,
              let vc = nav.topViewController as? ResCollectionPickController  else {
            return
        }
        
        let inspectorView = vc.inspectorView
        inspectorView.displayAttribute(view: view)
        
//        inspectorView.isHidden = false
        
        /// 显示侧边栏 (显示属性)
        splitViewController?.show(.primary)
    }
}

extension CanvasViewController: ResCollectionPickDelegate {
    
    func resourceCollection(didSelected item: CollectionResource) {
        let view = CustomImageView(source: item)
        switch item.type {
        case .svg:
            guard let image = SVGKImage(named: "\(item.name).svg").uiImage else {
                return
            }
            view.image = image
            view.frame = CGRect(origin: .zero, size: image.size)
        case .symbol:
            guard let image = UIImage(systemName: item.name) else {
                return
            }
            view.image = image
            view.frame = CGRect(origin: .zero, size: image.size)
        }
        view.isUserInteractionEnabled = true
        view.center = CGPoint(x: canvasView.bounds.midX, y: canvasView.bounds.midY)
        canvasView.addSubview(view)
        layers.append(view)
    }
}

/// 用以筛选判断
class CanvasView: UIView {}

/// 用以处理 `点击位置` 落在 `canvas` 外部时候点击处理
/// 否则在 `canvas` 外部的视图点击会无法弹出 `AttributesInspectorView`
class CanvasHitView: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        /// 当手势点击视图对象不是 `self` (背景视图) 时候, 返回对应视图
        /// 主要是处理 `AttributesInspectorView` 的点击事件
        if let supResult = super.hitTest(point, with: event), supResult != self {
            return supResult
        }
        
        /// 当手势点击位置为 `canvas` 外部时候执行以下代码
        /// 用以处理 `视图` 超出 `canvas` 范围时候点击的响应
        /// 获取 `canvas` 视图对象
        let canvas = subviews.first { $0 is CanvasView }
        
        return canvas?.subviews.first {
            /// 计算 point 是否在 image 视图的 bounds 范围内
            print($0)
            return $0.bounds.contains(self.convert(point, to: $0))
        } ?? self
    }
}
