//
//  MainView.swift
//  Animations
//
//  Created by Inncoder on 10/10/2020.
//  Copyright © 2020 Inncoder AS. All rights reserved.
//

import SwiftUI


struct MainView: View {
    @ObservedObject var viewRouter = ViewRouter()
    var body: some View {
        ZStack {
            
            offWhite.edgesIgnoringSafeArea(.all)
            
            switch viewRouter.currentView {
            case .home:
                Statistics()
            case .search:
                search()
            case .add:
                AddTask()
            case .likes:
                like()
            case .account:
                Account()
            }

            VStack {
                Spacer()
                DarkTabBar(viewRouter: viewRouter)
            }
        }
    }
    
    //MARK: - Drawing constants
    let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
//    let offWhite = Color(.white)
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
