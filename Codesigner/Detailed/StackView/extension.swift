//
//  extension.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/17.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var customTransition: AnyTransition {
      let transition = AnyTransition.offset(y: -screen.size.height/2.5)
        .combined(with: .offset(x:screen.size.width/10))
        .combined(with: .opacity)
      return transition
    }
}
