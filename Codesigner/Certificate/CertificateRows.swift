//
//  CertificateRows.swift
//  SwiftUIDemo
//
//  Created by LEE on 2019/10/19.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI

struct CertificateRows: View {
    
    @EnvironmentObject var certificateViewModel: CertificateViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("MileStones")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(certificateViewModel.certificateData) { item in
                        LeeView(item: item)
                    }
                }
                .padding(20)
                .padding(.leading, 10)
            }
        }
    }
}

struct CertificateRows_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRows()
    }
}


