//
//  ResCollectionViewCell.swift
//  UIDesign
//
//  Created by florrie on 2021/7/22.
//  
//

import UIKit
import SDWebImage
import SDWebImageSVGCoder
import SVGKit

class ResCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ResCollectionViewCell"
    
    public var data: CollectionResource? {
        didSet {
            guard let name = data?.name, let type = data?.type else {
                return
            }
            switch type {
            case .svg:
                imageView.image = SVGKImage(named: "\(name).svg").uiImage
            case .symbol:
                imageView.image = UIImage(systemName: name)
            }
        }
    }
    
    // 图片
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.tintColor = .red
        return view
    }()
    
    // 文本
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI
    
    private func setupUI() {
        contentView.backgroundColor = .rgb(226, 245, 254)
        contentView.addSubview(imageView)
        imageView.tintColor = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let offset = bounds.width / 4
        let width = bounds.width / 2
        
        imageView.frame = CGRect(x: offset,
                                 y: offset,
                                 width: width,
                                 height: width)
        label.frame = CGRect(x: offset,
                             y: offset,
                             width: width,
                             height: width)
    }
}
