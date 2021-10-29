//
//  TextView.swift
//  myspace
//
//  Created by admin on 2021/9/22.
//

import Foundation
import SwiftUI


struct TextView: View {
    var str:String
    var body: some View {
        Text(str)
            .font(.title)
            .foregroundColor(.init(red: 78/255, green: 140/255, blue: 168/255))
    }
}
