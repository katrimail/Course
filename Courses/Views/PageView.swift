//
//  PageView.swift
//  Courses
//
//  Created by Катрин Маилян on 19.01.2021.
//

import SwiftUI

struct PageView: View {
    @StateObject var pageData = PageViewModel()
    @Namespace var animation
    let columns = Array(repeating: GridItem(.flexible(), spacing: 45), count: 2)
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "eyeglasses")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "private" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack{
                            if pageData.selectedTab != "private"{
                                Color.clear
                            }
                            else{
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            }
                        }
                    )
                    .onTapGesture{
                        withAnimation{pageData.selectedTab = "private"}
                    }
                
                Text("1")
                    .frame(width: 35, height: 35)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(pageData.selectedTab == "tabs" ? Color.black : Color.white, lineWidth: 2))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "tabs" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(ZStack{
                        if pageData.selectedTab != "tabs"{
                            Color.clear
                        }
                        else{
                            Color.white
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                    )
                    .onTapGesture{
                        withAnimation{pageData.selectedTab = "tabs"}
                    }
                
                Image(systemName: "laptopcomputer")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "device" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(ZStack{
                        if pageData.selectedTab != "device"{
                            Color.clear
                        }
                        else{
                            Color.white
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                    )
                    .onTapGesture{
                        withAnimation{pageData.selectedTab = "device"}
                    }
            }
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20, content: {
                    ForEach(pageData.urls){ page in
                        WebView(url: page.url)
//                            .opacity(pageData.currentPage?.id == page.id ? 0.01 : 1)
                            .frame(height: 200)
                            .cornerRadius(15)
                        //Drag and Drop
                            .onDrag({
                                
                                pageData.currentPage = page
                                //sending id for sample
                                return NSItemProvider(contentsOf: URL(string: "\(page.id)")!)!
                                
                            })
                            .onDrop(of: [.url], delegate: DropViewDelegate(page: page, pageData: pageData))
                    }
                })
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Color-3").ignoresSafeArea(.all, edges: .all))
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
