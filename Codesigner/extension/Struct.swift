//
//  Struct.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/14.
//

import Foundation

struct AlgorithmData:Identifiable {
    var id = UUID()
    var imageName:String
    var title:String
    var content:String
    var introduction:String
    var rawValue:Int
    
    init(imageName:String, title:String, content:String,introduction:String,rawValue:Int){
        self.imageName = imageName
        self.title = title
        self.content = content
        self.introduction = introduction
        self.rawValue = rawValue
    }
}

struct SortInfo{
    var sortHeight:Int
    var sortOperation:String
    var sortTime:TimeInterval
}


struct SwiftUICourse:Identifiable{
    var id: Int
    var imageName:String
    var title:String
    var introduction:String
    
    static let SwiftUICourseData = [
        SwiftUICourse(
            id:1,
            imageName: "carouselSlider",
            title: "3D Carousel Slider",
            introduction: ("In this course, you will learn how to create a page with 3D rotation.")
        ),
        SwiftUICourse(
            id:2,
            imageName: "swipeaction",
            title: "Swipe Action",
            introduction: ("By studying this course, you will know how to make your label have a left/right sidebar.")
        ),
        SwiftUICourse(
            id:3,
            imageName: "safearea",
            title: "Safe Area Insect",
            introduction: ("By studying this course, you will learn how to make a bottom/top safety area and they do not cover all the components on your screen.")
        ),
        SwiftUICourse(
            id:4,
            imageName: "blureffect",
            title: "Blur Effect",
            introduction: ("By studying this course, you will learn how to make a mask image and change the thickness of the mask.")
        ),
        SwiftUICourse(
            id:5,
            imageName: "halfsheet",
            title: "Half Modal Sheet",
            introduction: ("By studying this course, you will learn how to make a popover that can be pulled halfway.")
        ),
    ]
}
