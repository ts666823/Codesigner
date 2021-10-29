//
//  PresentViewController.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/21.
//

import UIKit

class AddPresentViewController: UIViewController {
    @IBOutlet weak var input4Index: UITextField!
    @IBOutlet weak var input4Value: UITextField!
    
    var index4Add = 0
    var value4Add = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        input4Index.placeholder = "请输入新增结点的位置（从0开始）"
        input4Value.placeholder = "请输入新增结点的位置（从0开始）"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapBtn(_ sender: Any) {
        let indexText = input4Index.text
        let valueText = input4Value.text
        guard let indexNumber: Int = Int(indexText!) else {
            return
        }
        guard let valueNumber: Int = Int(valueText!) else {
            return
        }
        index4Add = indexNumber
        value4Add = valueNumber
        performSegue(withIdentifier: "Add2Main", sender: self)
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

class DeletePresentViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var input: UITextField!
    
    var index4Delete = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        input.placeholder = "请输入删除结点的位置（从0开始）"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapBtn(_ sender: Any) {
        let indexText = input.text
        guard let indexNumber: Int = Int(indexText!) else {
            return
        }
        index4Delete = indexNumber
        performSegue(withIdentifier: "Delete2Main", sender: self)
        self.dismiss(animated: true, completion: .none)
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


