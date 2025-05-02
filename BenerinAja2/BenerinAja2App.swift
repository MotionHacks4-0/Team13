//
//  BenerinAja2App.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

@main
struct BenerinAja2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

