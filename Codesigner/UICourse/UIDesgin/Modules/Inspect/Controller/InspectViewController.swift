//
//  InspectViewController.swift
//  UIDesign
//
//  Created by florrie on 2021/7/22.
//  
//

import UIKit

class InspectViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: UI
    private func setupUI() {
        title = "Code"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(back))
    }
    @objc func back() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

class AttributeInspectorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: UI
    private func setupUI() {
        title = "Inspection"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(back))
    }
    @objc func back() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
