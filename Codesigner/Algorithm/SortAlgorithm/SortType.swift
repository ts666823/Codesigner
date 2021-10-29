//
//  SortType.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/12.
//

import Foundation

protocol SortType {
    func sort(items: Array<SortInfo>) -> Array<SortInfo>
    func setEveryStepClosure(everyStepClosure: @escaping SortResultClosure,
                             sortSuccessClosure: @escaping SortSuccessClosure) -> Void
}
