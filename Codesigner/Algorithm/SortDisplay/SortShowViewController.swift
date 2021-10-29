//
//  SortShowViewController.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/12.
//

import UIKit
import SwiftUI
import Combine

class SortShowViewController: UIViewController ,UITextFieldDelegate {
    
    
    var certificateViewModel: CertificateViewModel!
    var store: UpdateStore!
    
    @IBOutlet weak var buttomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet var displayView: UIView!
    @IBOutlet var numberCountTextField: UITextField!
    @IBOutlet weak var codeTextView: UITextView!
    @IBOutlet weak var operationTextView: UITextView!
    @IBOutlet weak var modelView: UIView!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var starBtn: UIBarButtonItem!
    
    var sortViews: Array<SortView> = []
    var sortInfo:Array<SortInfo>=[]
    var sort: SortType! = BubbleSort()
    var timeInterval:TimeInterval = 0.1
    
    var isStar = false
    var havaLearnt = false
    

    
    var algorithmData:AlgorithmData = AlgorithmData(imageName: "sorting", title: "Bubble Sort", content: "Time complexity - O (N^2)", introduction: "Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order.",rawValue: 0)
    var text = """
    do
      swapped = false
      for i = 1 to indexOfLastUnsortedElement-1
        if leftElement > rightElement
          swap(leftElement, rightElement)
          swapped = true
    while swapped
    """
    
    var numberCount: Int = 20
        
    var displayViewHeight: CGFloat {
        get {
            return displayView.frame.height
        }
    }
    
    var displayViewWidth: CGFloat {
        get {
            return displayView.frame.width
        }
    }
    
    var sortViewWidth: CGFloat {
        get {
            return self.displayViewWidth / CGFloat(self.numberCount)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle.title = algorithmData.title
        self.numberCountTextField.delegate = self
        self.numberCountTextField.placeholder = "Please enter the number"
        let sortType = SortTypeEnum(rawValue: algorithmData.rawValue)!
        self.sort = SortFactory.create(type: sortType)
        self.setSortClosure()
        self.setBorder()
        self.codeTextView.text = text
        modelView.isHidden = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if sortViews.isEmpty {
            self.configSortViewHeight()
            self.addSortViews()
        }
    }
    
    
    func setBorder(){
        //设置tipLabel边框 左上方Label
        topView.layer.cornerRadius = topView.frame.height/4
        topView.layer.masksToBounds = true
        topView.layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMaxYCorner.rawValue | CACornerMask.layerMaxXMaxYCorner.rawValue )
        topView.layer.shadowColor = Color.black.cgColor
        topView.layer.shadowOffset = CGSize(width: 0, height: 5)
        topView.layer.shadowRadius = topView.frame.height/8
       
        buttomView.layer.cornerRadius = buttomView.frame.height/16
        buttomView.layer.masksToBounds = true
        
        displayView.layer.borderWidth = 3
        displayView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8274509804, blue: 0.8901960784, alpha: 1)
        
        for i in store.updates{
            if i.title == algorithmData.title
            {
                isStar = true
                starBtn.image = UIImage(systemName: "star.fill")
            }
            else
            {
                isStar = false
                starBtn.image = UIImage(systemName: "star")
            }
        }
        
        for i in certificateViewModel.certificateData{
            if i.title == algorithmData.title
            {
                havaLearnt = true
            }
            else
            {
                havaLearnt = false
            }
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        UIViewController.attemptRotationToDeviceOrientation()
//    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        timeInterval = TimeInterval(0.1 / speedSlider.value)
        for i in 0..<sortInfo.count {
            sortInfo[i].sortTime = timeInterval
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func leftBtn(_ sender: Any) {
        self.numberCount -= 10
        numberCountTextField.text = numberCount.description
        self.resetSubViews()
    }
    @IBAction func rightBtn(_ sender: Any) {
        self.numberCount += 10
        numberCountTextField.text = numberCount.description
        self.resetSubViews()
    }
    
    @IBAction func starBtn(_ sender: Any) {
        starBtn.image = UIImage(systemName: "star.fill")
        let df = DateFormatter()
        df.dateFormat = "MMM dd"
        if(isStar)
        {
            
        }
        else{
            store.addFavoriteData(data: Update(image: "Illustration1", title: algorithmData.title, text: "Congratulations! You have completed the study of \(algorithmData.title)", date: df.string(from: Date())))
            isStar = true
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if(havaLearnt)
        {
            
        }
        else{
            certificateViewModel.addCertificateData(data: Certificate(title: algorithmData.title, image: "Certificate1", width: 230, height: 150))
            havaLearnt = true
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSortButton(_ sender: AnyObject) {
        let text = numberCountTextField.text
        guard let number: Int = Int(text!) else {
            self.modelView.isHidden = false
            DispatchQueue.global().async {
                //self.sortViewHight = self.sort.sort(items: self.sortViewHight)
                self.sortInfo = self.sort.sort(items: self.sortInfo)
            }
            return
        }
        self.resetSubViews()
        numberCount = number
        self.modelView.isHidden = false
        DispatchQueue.global().async {
            //self.sortViewHight = self.sort.sort(items: self.sortViewHight)
            self.sortInfo = self.sort.sort(items: self.sortInfo)
        }
        certificateViewModel.addCertificateData(data: Certificate(title: algorithmData.title, image: "Certificate1", width: 230, height: 150))
    }
    
    
    //MARK: -- UITextFieldDelegate
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let text = textField.text
        guard let number: Int = Int(text!) else {
            return true
        }
        numberCount = number
        self.resetSubViews()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        // 只允许输入数字和两位小数
        //let expression =  "^[0-9]*((\\.|,)[0-9]{0,2})?$"
        let expression = "^[0-9]*([0-9])?$"// 只允许输入纯数字
        // let expression = "^[A-Za-z0-9]+$" //允许输入数字和字母
        let regex = try!  NSRegularExpression(pattern: expression, options: .allowCommentsAndWhitespace)
        let numberOfMatches =  regex.numberOfMatches(in: newString, options:.reportProgress,    range:NSMakeRange(0, newString.count))
        if  numberOfMatches == 0{
             print("请输入数字")
             return false
        }
      return true
    }


    //MARK: - Private Method
    /// 设置排序对象相关的回调
    private func setSortClosure() {
        weak var weak_self = self
        sort.setEveryStepClosure(everyStepClosure: { (index, value) in
            DispatchQueue.main.async {
                weak_self?.updateSortViewHeight(index: index, value: CGFloat(value.sortHeight))
                weak_self?.updateSortOperation(operation: value.sortOperation)
            }
        }) { (list) in
            DispatchQueue.main.async {
                weak_self?.modelView.isHidden = true
            }
        }
    }
    
    /// 随机生成sortView的高度
    private func configSortViewHeight() {
        if !sortInfo.isEmpty {
            sortInfo.removeAll()
        }
        for _ in 0..<self.numberCount {
            self.sortInfo.append(SortInfo(sortHeight: Int(arc4random_uniform(UInt32(displayViewHeight))), sortOperation: "", sortTime: timeInterval))
        }
    }
    
    private func addSortViews() {
        for i in 0..<self.numberCount {
            let size: CGSize = CGSize(width: self.sortViewWidth, height: CGFloat(sortInfo[i].sortHeight))
            let origin: CGPoint = CGPoint(x: CGFloat(i) * sortViewWidth, y: 0)
            let sortView = SortView(frame: CGRect(origin: origin, size: size))
            self.displayView.addSubview(sortView)
            self.sortViews.append(sortView)
        }
    }
    
    private func updateSortViewHeight(index: Int, value: CGFloat) {
        self.sortViews[index].updateHeight(height: value)
    }
    
    private func updateSortOperation(operation:String) {
        self.operationTextView.text = operation
    }
    
    private func resetSubViews()  {
        for subView in self.sortViews  {
            subView.removeFromSuperview()
        }
        self.sortViews.removeAll()
        self.sortInfo.removeAll()
        self.configSortViewHeight()
        self.addSortViews()
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

