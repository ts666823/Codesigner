//
//  UpdateStore.swift
//  SwiftUIDemo
//
//  Created by LEE on 2019/10/19.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    let didChange = PassthroughSubject<Void, Never>()
    
    @Published var updates: [Update] = [Update(image: "Illustration1", title: "SwiftUI", text: "Congratulations! You have completed the study of 3DCarouselSlider", date: "JUN 26"),
                                        Update(image: "Illustration2", title: "Algorithm", text: "Congratulations! You have completed the study of bubble sorting", date: "JUN 27"),
                                        Update(image: "Illustration3", title: "SwiftUI", text: "Congratulations! You have completed the study of HalfModalSheet", date: "JUN 26"),
                                        Update(image: "Illustration4", title: "SwiftUI", text: "Congratulations! You have completed the study of radix sorting", date: "JUN 26")]
    
    init() {
        
    }
    
    func addFavoriteData(data:Update){
        self.updates.append(data)
    }
}
