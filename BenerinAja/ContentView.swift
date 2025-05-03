//
//  ContentView.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if AppState.shared.isAuthenticated {
            HomeView()
        }else {
            OnboardingView()
        }
    }
}

