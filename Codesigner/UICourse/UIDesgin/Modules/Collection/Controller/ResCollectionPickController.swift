//
//  ResCollectionViewController.swift
//  UIDesign
//
//  Created by florrie on 2021/7/22.
//  
//

import UIKit

protocol ResCollectionPickDelegate {
    func resourceCollection(didSelected item: CollectionResource)
}

class ResCollectionPickController: UIViewController {
    
    // 代理对象
    public var delegate: ResCollectionPickDelegate?
    
    // 布局对象
    public let layout = UICollectionViewFlowLayout()
    
    // 属性
    public let inspectorView = AttributesInspectorView()
    
    // 列表视图
    public lazy var collectionView: UICollectionView = {
        let newView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        newView.dataSource = self
        newView.delegate = self
        newView.register(ResCollectionViewCell.self, forCellWithReuseIdentifier: ResCollectionViewCell.identifier)
        newView.backgroundColor = .white
        newView.alwaysBounceVertical = true
//        newView.alwaysBounceHorizontal = true
        return newView
    }()
    
    // 素材列表
    private let dataSet: [CollectionResource] = {
        guard let path = Bundle.main.path(forResource: "ResourceList", ofType: "plist"),
              let source = NSArray(contentsOfFile: path),
              let jsonData = try? JSONSerialization.data(withJSONObject: source, options: .fragmentsAllowed) else {
            return []
        }
        return (try? JSONDecoder().decode([CollectionResource].self, from: jsonData)) ?? []
    }()
    
    // MARK: Init
    
    init(delegate: ResCollectionPickDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: UI
    public func setupUI() {
        title = "Kit Garage"
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(inspectorView)
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"),
                                                               style: .done,
                                                               target: self,
                                                               action: #selector(back))
        }
        inspectorView.isHidden = true
        
        inspectorView.addObserver(self, forKeyPath: "hidden", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let inspector = object as? AttributesInspectorView else { return }
        if inspector.isHidden {
            collectionView.contentInset = .zero
        } else {
            collectionView.contentInset = UIEdgeInsets(top: 0,
                                                       left: 0,
                                                       bottom: AttributesInspectorView.height,
                                                       right: 0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = CGRect(x: view.safeAreaInsets.left,
                                      y: view.safeAreaInsets.top,
                                      width: view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
                                      height: view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        
        
        inspectorView.frame = CGRect(x: view.safeAreaInsets.left,
                                     y: collectionView.frame.maxY - AttributesInspectorView.height,
                                     width: view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
                                     height: 0)
        
        
        /*
        inspectorView.frame = CGRect(x: view.safeAreaInsets.left,
                                     y: view.safeAreaInsets.top,
                                     width: view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
                                     height: 0)
        
        collectionView.frame = CGRect(x: inspectorView.frame.minX,
                                      y: inspectorView.frame.maxY,
                                      width: inspectorView.frame.width,
                                      height: view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - inspectorView.frame.height)
        */
        
        // 九宫格的 间距 和 边距
        let margin: CGFloat = 10.0
        
        // 每行显示个数
        // iPhone 默认 3
        // iPad 默认 5
        let linItemCount: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 3 : 5
        
        // 计算布局信息
    
        let itemWidth = floor(
            (collectionView.bounds.width - margin * (linItemCount + 1)) / linItemCount
        )
        print(itemWidth)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin
        layout.sectionInset = UIEdgeInsets(top: margin,
                                           left: margin,
                                           bottom: margin,
                                           //right: view.bounds.width - itemWidth * 3 - margin * 3
                                           right: margin)
        collectionView.reloadData()
    }
    
    @objc func back() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension ResCollectionPickController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResCollectionViewCell.identifier, for: indexPath) as! ResCollectionViewCell
        cell.data = dataSet[indexPath.row]
        return cell
    }
}

extension ResCollectionPickController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.resourceCollection(didSelected: dataSet[indexPath.row])
        
        /// 在 `iPhone` 上选中后页面 `dismiss`
        if UIDevice.current.userInterfaceIdiom == .phone {
            navigationController?.dismiss(animated: true, completion: nil)
        }
    }
}
