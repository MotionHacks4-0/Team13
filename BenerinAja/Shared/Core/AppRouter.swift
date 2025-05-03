//
//  AppRoute.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI

enum Route {
    case home(AppRouter)
    case category(AppRouter)
    case history(AppRouter)
    case chat(AppRouter)
    case signin(AppRouter)
}

extension Route: View {
    var body: some View {
        switch self {
        case .home(let router):
            HomeView(router: router)
        case .category(let router):
            CategoryView(router: router)
        case .history(let router):
            HistoryView(router: router)
        case .chat(let router):
            ChatView(router: router)
        case .signin(let router):
            SigninView(router: router)
        }
    }
    
    var id: Int {
        switch self {
        case .home: 1
        case .category: 2
        case .history: 3
        case .chat: 4
        case .signin: 5
        }
    }
}

final class AppRouter: ObservableObject {
    
    @Published var routes: [Route] = []
    
    func route(to view: Route) {
        routes.append(view)
    }
    
    func back() {
        _ = routes.popLast()
    }
    
    func backToRoot() {
        routes = []
    }
}

extension Route: Hashable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}
