//
//  safeAreaViewController.swift
//  myspace
//
//  Created by admin on 2021/10/6.
//

import UIKit
import SwiftUI
@available(iOS 15.0, *)
class safeAreaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let swiftUIView = safeAreaView() // swiftUIView is View
        let profileViewController = UIHostingController(rootView: swiftUIView)
        
        profileViewController.view.frame = self.view.frame
        addChild(profileViewController)
        profileViewController.didMove(toParent: self)
        view.addSubview(profileViewController.view)
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
