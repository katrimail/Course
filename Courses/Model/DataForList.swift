//
//  DataForList.swift
//  Courses
//
//  Created by Катрин Маилян on 28.12.2020.
//

import SwiftUI
struct Course : Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var numCourse : Int
    var asset : String
}

// both image and color name is same so i used common word asset...

var courses = [

    Course(name: "Coding", numCourse: 12,asset: "coding"),
    Course(name: "Trading", numCourse: 12,asset: "trading"),
    Course(name: "Cooking", numCourse: 12,asset: "cooking"),
    Course(name: "Marketing", numCourse: 12,asset: "marketing"),
    Course(name: "UI/UX", numCourse: 12,asset: "ux"),
    Course(name: "Digital Marketing", numCourse: 12,asset: "digital")
]


 
