//
//  AlgorithmMainViewController.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/9.
//

import UIKit

class AlgorithmMainViewController: UIViewController{

    @IBOutlet weak var algorithmView: UIView!
    @IBOutlet weak var dataStructorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dataStructorImageView: UIImageView!
    @IBOutlet weak var algorithmCollectionView: UICollectionView!
    @IBOutlet weak var dataStructorCollectionView: UICollectionView!
    
    var chooseRow:Int = 0
    var isAlgorithm:Bool = true
    var algorithmData:[AlgorithmData] = []
    var dataStructureData:[AlgorithmData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        algorithmCollectionView.delegate = self
        algorithmCollectionView.dataSource = self
        
        dataStructorCollectionView.delegate = self
        dataStructorCollectionView.dataSource = self
        
        setBorder()
        initialAlgorithmData()
        initialDataStructure()
        // Do any additional setup after loading the view.
        
    }
    
    func setBorder() {
        algorithmView.addShadow(color: .gray, offset:  CGSize(width: 10, height: 10), opacity: 0.5)
        dataStructorView.addShadow(color: .gray, offset:  CGSize(width: 0, height: 10), opacity: 0.5)
        imageView.layer.cornerRadius = imageView.frame.height/16
        imageView.layer.masksToBounds = true
        imageView.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMaxXMinYCorner.rawValue | CACornerMask.layerMinXMinYCorner.rawValue)
        dataStructorImageView.layer.cornerRadius = imageView.frame.height/16
        dataStructorImageView.layer.masksToBounds = true
        dataStructorImageView.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMaxXMinYCorner.rawValue | CACornerMask.layerMinXMinYCorner.rawValue)
    }
    
    @IBAction func learnBtn(_ sender: Any) {
        performSegue(withIdentifier: "toLearn", sender: self)
    }
    
    func initialAlgorithmData()
    {
        let algorithmList:String = Bundle.main.path(forResource: "AlgorithmInfo", ofType:"plist")!
        let algorithmDataDic:NSMutableDictionary = NSMutableDictionary(contentsOfFile:algorithmList)!
        let algorithmDataArray:NSArray = algorithmDataDic.object(forKey: "Algorithm") as! NSArray
    
        for data in algorithmDataArray
        {
            let dataDic = data as! NSMutableDictionary
            let title = dataDic.object(forKey: "title") as! String
            let content = dataDic.object(forKey: "content") as! String
            let introduction = dataDic.object(forKey: "introduction") as! String
            let rawValue = dataDic.object(forKey: "rawValue") as! Int
            let imageName = dataDic.object(forKey: "imageName") as! String
            algorithmData.append(AlgorithmData(imageName: imageName, title: title, content: content, introduction: introduction, rawValue: rawValue))
        }
    }
    


    
    func initialDataStructure()
    {
        let dataStructureList:String = Bundle.main.path(forResource: "AlgorithmInfo", ofType:"plist")!
        let dataStructureDataDic:NSMutableDictionary = NSMutableDictionary(contentsOfFile:dataStructureList)!
        let dataStructureDataArray:NSArray = dataStructureDataDic.object(forKey: "DataStructure") as! NSArray
    
        for data in dataStructureDataArray
        {
            let dataDic = data as! NSMutableDictionary
            let title = dataDic.object(forKey: "title") as! String
            let content = dataDic.object(forKey: "content") as! String
            let introduction = dataDic.object(forKey: "introduction") as! String
            let rawValue = dataDic.object(forKey: "rawValue") as! Int
            let imageName = dataDic.object(forKey: "imageName") as! String
            dataStructureData.append(AlgorithmData(imageName: imageName, title: title, content: content, introduction: introduction, rawValue: rawValue))
        }
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    */

}
