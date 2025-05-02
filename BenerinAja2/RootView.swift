//
//  RootView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//

import SwiftUI

struct RootView: View {
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                SplashScreenView()
            } else {
                OnboardingScreenView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

