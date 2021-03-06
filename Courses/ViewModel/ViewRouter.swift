//
//  ViewRouter.swift
//  Animations
//
//  Created by Inncoder on 10/10/2020.
//  Copyright © 2020 Inncoder AS. All rights reserved.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentView: Route = Route.home
    
    func imageName(route: Route) -> String {
        switch route {
        case .home:
            return "chart.bar.xaxis"
        case .search:
            return "magnifyingglass"
        case .add:
            return "arrowtriangle.forward.square"
        case .likes:
            return "book"
        case .account:
            return "person.fill"
        }
    }
}

enum Route: CaseIterable {
    case home
    case search
    case add
    case likes
    case account
}
