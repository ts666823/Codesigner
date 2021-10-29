//
//  testViewController.swift
//  myspace
//
//  Created by admin on 2021/9/21.
//

import UIKit
import Foundation
import SwiftUI

@available(iOS 15.0, *)
class contentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftUIView = ContentView2() // swiftUIView is View
        let profileViewController = UIHostingController(rootView: swiftUIView)
        
        profileViewController.view.frame = self.view.frame
        addChild(profileViewController)
        profileViewController.didMove(toParent: self)
        view.addSubview(profileViewController.view)
    }

}

