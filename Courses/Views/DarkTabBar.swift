//
//  DarkTabBar.swift
//  Animations
//
//  Created by Inncoder on 10/10/2020.
//  Copyright © 2020 Inncoder AS. All rights reserved.
//

import SwiftUI

struct DarkTabBar: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: tabCornerRadius)
                .frame(width: tabSizeWidth, height: tabSizeHeight)
            ZStack {
                Rectangle()
                    .frame(width: 70, height: tabSizeHeight)
                    .background(gradientColor)
                    .opacity(0.5)
                    .mask(lightShape())
                RoundedRectangle(cornerRadius: tabCornerRadius)
                    .frame(width: 45, height: 5)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -tabSizeHeight / 2)
            }
            .offset(x: calcLightOffset(route: viewRouter.currentView), y: 0)
            .animation(Animation.easeInOut)
            
            HStack(spacing: (tabSizeWidth - (tabItemSize * CGFloat(Route.allCases.count))) / CGFloat(Route.allCases.count)) {
                ForEach(0..<Route.allCases.count, id: \.self) { i in
                    Button(action: {
                        viewRouter.currentView = Route.allCases[i]
                    }, label: {
                        Image(systemName: viewRouter.imageName(route: Route.allCases[i]))
                            .resizable()
                            .frame(width: tabItemSize, height: tabItemSize)
                            .foregroundColor(Route.allCases[i] == viewRouter.currentView ? .white : Color(UIColor.darkGray))
                            .animation(Animation.easeInOut)
                    })
                }
            }
        }
        .mask(RoundedRectangle(cornerRadius: tabCornerRadius).frame(width: tabSizeWidth, height: tabSizeHeight))
    }
    
    //MARK: - Drawing constants
    let gradientColor = LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
    let tabCornerRadius: CGFloat = 0
    let tabSizeWidth: CGFloat = 415
    let tabSizeHeight: CGFloat = 65
    let tabItemSize: CGFloat = 25
    
    
    func calcLightOffset(route: Route) -> CGFloat {
        let spacing = (tabSizeWidth - (tabItemSize * CGFloat(Route.allCases.count))) / CGFloat(Route.allCases.count)
        let offset = spacing + tabItemSize
        
        switch route {
        case .home:
            return -(offset * 2)
        case .search:
            return -offset
        case .add:
            return 0
        case .likes:
            return offset
        case .account:
            return offset * 2
        }
    }
}

struct lightShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let part = rect.maxX / 4
    
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - part, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + part, y: rect.minY))
        
        path.closeSubpath()
        return path
    }
}


struct DarkTabBar_Previews: PreviewProvider {
    static var previews: some View {
        DarkTabBar(viewRouter: ViewRouter())
    }
}
