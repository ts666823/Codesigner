//
//  CollectionResource.swift
//  UIDesign
//
//  Created by florrie on 2021/7/22.
//

import UIKit

struct CollectionResource: Codable {
    let name: String
    let type: Type
}

extension CollectionResource {
    
    enum `Type`: Int, Codable {
        case svg    = 0
        case symbol = 1
    }
}
