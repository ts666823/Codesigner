//
//  AttributesInspectorView.swift
//  UIDesign
//
//  Created by florrie on 2021/7/22.
//  
//

import UIKit

class AttributesInspectorView: UIView {
    
    public static let height: CGFloat = 450
    
    private let label = UILabel()
    private let button = UIButton(type: .system)
    private let xView = AttributeView()
    private let yView = AttributeView()
    private let wView = AttributeView()
    private let hView = AttributeView()
    private let textView = UITextView()
    override var frame: CGRect {
        set {
            super.frame = CGRect(origin: newValue.origin,
                                 size: CGSize(width: newValue.width, height: AttributesInspectorView.height))
        }
        get {
            super.frame
        }
    }
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    // MAKR: UI
    private func setupUI() {
        backgroundColor = .white
        addSubview(label)
        addSubview(button)
        addSubview(xView)
        addSubview(yView)
        addSubview(wView)
        addSubview(hView)
        addSubview(textView)
        
        xView.label.text = "    X      "
        yView.label.text = "    Y      "
        wView.label.text = " width  "
        hView.label.text = " height "
        
        layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = 1.0
        
        xView.delegate = self
        yView.delegate = self
        wView.delegate = self
        hView.delegate = self
        
        label.text = "Inspection"
        label.textColor = UIColor.blue
        button.setImage(UIImage(named: "sure"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        textView.isEditable = false
        textView.layer.borderColor = UIColor.separator.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        textView.backgroundColor = UIColor.separator.withAlphaComponent(0.05)
        textView.font = UIFont.systemFont(ofSize: 20.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        /*
        /// 输入框宽度
        let inputWidth: CGFloat = max(200, bounds.width * 0.2)
        label.frame = CGRect(x: 15, y: 20, width: 100, height: 20)
        button.frame = CGRect(x: bounds.width - 50, y: 10, width: 40, height: 40)
        xView.frame = CGRect(x: 15, y: 60, width: inputWidth, height: 40)
        yView.frame = CGRect(x: 15, y: xView.frame.maxY + 20, width: inputWidth, height: 40)
        wView.frame = CGRect(x: 15, y: yView.frame.maxY + 20, width: inputWidth, height: 40)
        hView.frame = CGRect(x: 15, y: wView.frame.maxY + 20, width: inputWidth, height: 40)
        
        
        textView.frame = CGRect(x: hView.frame.maxX + 15.0,
                                y: xView.frame.minY,
                                width: bounds.width - hView.frame.maxX - 30.0,
                                height: hView.frame.maxY - xView.frame.minY)
         */
        
        let inputWidth: CGFloat = bounds.width - 30
        label.frame = CGRect(x: 15, y: 20, width: 100, height: 20)
        button.frame = CGRect(x: bounds.width - 50, y: 10, width: 40, height: 40)
        xView.frame = CGRect(x: 15, y: 60, width: inputWidth, height: 40)
        yView.frame = CGRect(x: 15, y: xView.frame.maxY + 20, width: inputWidth, height: 40)
        wView.frame = CGRect(x: 15, y: yView.frame.maxY + 20, width: inputWidth, height: 40)
        hView.frame = CGRect(x: 15, y: wView.frame.maxY + 20, width: inputWidth, height: 40)
        
        textView.frame = CGRect(x: hView.frame.minX,
                                y: hView.frame.maxY + 15,
                                width: bounds.width - 30,
                                height: bounds.height - hView.frame.maxY - 30)
    }
    // MARK: 选中处理
    // 引用对象, 修改属性使用
    private var holder: CustomImageView?
    public func displayAttribute(view: CustomImageView) {
        holder = view
        xView.text = "\(floor(view.frame.origin.x))"
        yView.text = "\(floor(view.frame.origin.y))"
        wView.text = "\(floor(view.frame.size.width))"
        hView.text = "\(floor(view.frame.size.height))"
        textView.text = code(view.source, frame: view.frame)
        
        xView.delegate = self
        yView.delegate = self
        wView.delegate = self
        hView.delegate = self
        
        isHidden = false
    }
    // MARK: Action
    @objc private func close() {
        // 隐藏属性面板
        isHidden = true
        guard let view = holder else { return }
        var x: CGFloat = view.frame.origin.x
        var y: CGFloat = view.frame.origin.y
        var w: CGFloat = view.frame.width
        var h: CGFloat = view.frame.height
        // 获取 frame 的属性
        guard let tx = xView.text, let nx = Float(tx) else { return }
        x = CGFloat(nx)
        guard let ty = yView.text, let ny = Float(ty) else { return }
        y = CGFloat(ny)
        guard let tw = wView.text, let nw = Float(tw) else { return }
        w = CGFloat(nw)
        guard let th = hView.text, let nh = Float(th) else { return }
        h = CGFloat(nh)
        // 设置 frame
        view.frame = CGRect(x: x, y: y, width: w, height: h)
        // 释放引用
        holder = nil
    }
    
    // MARK: - Private
    
    private func code(_ source: CollectionResource, frame: CGRect) -> String {
        var imageText = ""
        if source.type == .svg {
            imageText = "let image = UIImage(named: \"\(source.name)\")"
        } else {
            imageText = "let image = UIImage(systemName: \"\(source.name)\")"
        }
        /*
        return """
        \(imageText)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: \(floor(frame.origin.x)), y: \(floor(frame.origin.y)), width: \(floor(frame.width)), height: \(floor(frame.height)))
        view.addSubview(imageView)
        """
        */
        return """
        struct ContentView: View {
            var svgName: String
            var body: some View {
                SVGImage(svgName: \"\(source.name)\")
            }
        }
        
        struct SVGImage: UIViewRepresentable {
            var svgName: String
            func makeUIView(context: Context) -> SVGView {
                let svgView = SVGView()
                svgView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)   // otherwise the background is black
                svgView.fileName = self.svgName
                svgView.contentMode = .scaleToFill
                return svgView
            }
        }
        """
    }
}

extension AttributesInspectorView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 开始编辑时候选中全部文本
        guard let start = textField.position(from: textField.beginningOfDocument, offset: 0),
              let end = textField.position(from: textField.endOfDocument, offset: 0) else {
            return
        }
        textField.selectedTextRange = textField.textRange(from: start, to: end)
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print(#function)
//        close()
//    }
}

fileprivate class AttributeView: UITextField {
    let label = UILabel()
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - UI
    private func setupUI() {
        label.textAlignment = .center
        label.frame = CGRect(x: 10, y: 0, width: 50, height: 30)
        // 设置左侧标题信息
        leftView = label
        leftViewMode = .always
        // 设置边框样式
        borderStyle = .roundedRect
        // 设置键盘样式
        keyboardType = .numberPad
    }
    
    
    
}

