//
//  AlgoruthmCollectionViewCell.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/9.
//

import UIKit

class AlgorithmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0,height: 4)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 10
    }

}
