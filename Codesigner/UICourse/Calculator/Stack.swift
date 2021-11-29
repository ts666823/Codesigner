//
//  Stack.swift
//  Calculator
//
//  Created by admin on 2021/10/15.
//

import Foundation
import SwiftUI
class Stack{
    var stack:[AnyObject]
    
    init(){
        stack = [AnyObject]()
    }
    func pop() -> AnyObject? {
        if !isEmpty(){
            return stack.removeLast()
        }else{
            return nil
        }
    }
    func push(element:AnyObject){
        stack.append(element)
    }
    func isEmpty()->Bool{
        return stack.isEmpty
    }
    func peek()->AnyObject?{
        return stack.last
    }
    func size()->Int{
        return stack.count
    }
}



