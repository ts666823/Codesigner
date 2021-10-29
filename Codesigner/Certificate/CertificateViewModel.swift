//
//  CertificateViewModel.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/24.
//

import Combine
import Foundation
import SwiftUI

class CertificateViewModel :ObservableObject{
    @Published var certificateData:[Certificate] = [
        Certificate(title: "SwipeAction", image: "Certificate1", width: 230, height: 150),
        Certificate(title: "SaftAreaInsect", image: "Certificate2", width: 230, height: 150),
        Certificate(title: "HalfModalSheet", image: "Certificate3", width: 230, height: 150),
        Certificate(title: "BlurEffect", image: "Certificate4", width: 230, height: 150),
    ]
    
    
    func addCertificateData(data:Certificate){
        self.certificateData.append(data)
    }
    
    
    
}


struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var width: CGFloat
    var height: CGFloat
}

