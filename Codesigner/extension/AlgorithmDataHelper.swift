//
//  getAlgorithmData.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/19.
//

import Foundation

class AlgorithmDataHelper
{
    static func initialAlgorithmData() -> [AlgorithmData]
    {
        var algorithmData:[AlgorithmData] = []
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
        
        return algorithmData
    }
}
