//
//  DropViewDelegate.swift
//  Courses
//
//  Created by Катрин Маилян on 20.01.2021.
//

import SwiftUI

//Drop delegate func...
struct DropViewDelegate: DropDelegate {
    var page: PageForLesson
    var pageData: PageViewModel
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    func dropEntered(info: DropInfo) {
        let fromIndex = pageData.urls.firstIndex {(page) -> Bool in
            return page.id == pageData.currentPage?.id
        } ?? 0
        
        let toIndex = pageData.urls.firstIndex {(page) -> Bool in
            return page.id == self.page.id
        } ?? 0
        
        if fromIndex != toIndex{
            withAnimation(.default){
                let fromPage = pageData.urls[fromIndex]
                pageData.urls[fromIndex] = pageData.urls[toIndex]
                pageData.urls[toIndex] = fromPage
            }
        }
    }
     
    func dropUpdated(info: DropInfo) -> DropProposal?{
        return DropProposal(operation: .move)
    }
}


