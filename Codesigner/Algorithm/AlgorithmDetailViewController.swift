//
//  AlgorithmDetailViewController.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/9.
//

import UIKit

class AlgorithmDetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var imageBig: UIImageView!
    @IBOutlet weak var imageSmall: UIImageView!
    @IBOutlet weak var algorithmTitle: UILabel!
    @IBOutlet weak var algorithmContent: UILabel!

    @IBOutlet weak var textFileld: UITextView!
    
    
    var algorithmData:AlgorithmData = AlgorithmData(imageName: "sorting", title: "冒泡排序", content: "最简单的排序", introduction: "冒泡排序（BubbleSort），是一种计算机科学领域的较简单的排序算法。它重复地走访过要排序的元素列，依次比较两个相邻的元素，如果顺序（如从大到小、首字母从Z到A）错误就把他们交换过来。走访元素的工作是重复地进行直到没有相邻元素需要交换，也就是说该元素列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端（升序或降序排列），就如同碳酸饮料中二氧化碳的气泡最终会上浮到顶端一样，故名“冒泡排序”。",rawValue:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFileld.text = algorithmData.introduction
        imageBig.image = UIImage(named: algorithmData.imageName)
        imageSmall.image = UIImage(named: algorithmData.imageName)
        algorithmTitle.text = algorithmData.title
        algorithmContent.text = algorithmData.content
        // Do any additional setup after loading the view.

    }
    
    @IBAction func tapLearnBtn()
    {
        print(algorithmData.rawValue)
        if(algorithmData.rawValue == 10){
            performSegue(withIdentifier: "detailToList", sender: self)
        }
        else{
            performSegue(withIdentifier: "detailToLearn", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailToLearn"){
            let des = segue.destination as! SortShowViewController
            des.algorithmData = self.algorithmData
        }
    }
    




    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
