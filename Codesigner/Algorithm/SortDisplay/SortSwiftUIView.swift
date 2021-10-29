//
//  SortView.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/19.
//

import SwiftUI

struct SortSwiftUIView: UIViewControllerRepresentable {
    
    @EnvironmentObject var certificateViewModel: CertificateViewModel
    @EnvironmentObject var store: UpdateStore
   public var algorithmData:AlgorithmData
    
  typealias UIViewControllerType = SortShowViewController
    
  func makeUIViewController(context: UIViewControllerRepresentableContext<SortSwiftUIView>) -> SortSwiftUIView.UIViewControllerType {
      
      let viewController  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SortShowView") as! SortShowViewController
    
      viewController.certificateViewModel = certificateViewModel
      viewController.store = store
      viewController.algorithmData = algorithmData
      
    return viewController
      
}
    
  func updateUIViewController(_ uiViewController: SortSwiftUIView.UIViewControllerType, context: UIViewControllerRepresentableContext<SortSwiftUIView>) {}
}
