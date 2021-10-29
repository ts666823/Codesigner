//
//  HomeViewModel.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/20.
//

import Foundation
import Combine

class HomeViewModel :ObservableObject{
    @Published var algorithmCourseData:[AlgorithmData] = []
    
    init()
    {
        loadAlgorithmData()
    }
    
    func loadAlgorithmData()
    {
        algorithmCourseData = AlgorithmDataHelper.initialAlgorithmData()
    }
}


