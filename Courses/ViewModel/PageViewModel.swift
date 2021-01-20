//
//  PageViewModel.swift
//  Courses
//
//  Created by Катрин Маилян on 19.01.2021.
//

import SwiftUI

class PageViewModel: ObservableObject {
    @Published var selectedTab = "tabs"
    @Published var urls = [
        PageForLesson(url: URL(string: "https://www.hse.ru/news/318774082.html")!),
        PageForLesson(url: URL(string: "https://www.hse.ru")!),
        PageForLesson(url: URL(string: "https://www.hse.ru/sumschool/")!),
        PageForLesson(url: URL(string: "https://olymp.hse.ru/mmo/")!),
        PageForLesson(url: URL(string: "https://shkolnikam.hse.ru")!),
        PageForLesson(url: URL(string: "https://www.google.com")!),
        PageForLesson(url: URL(string: "https://fdp.hse.ru")!),
        PageForLesson(url: URL(string: "https://www.google.com")!),
        PageForLesson(url: URL(string: "https://www.google.com")!),
    ]
    
    @Published var currentPage: PageForLesson?
}

