//
//  OnboardingView.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var router: AppRouter = .init()
    
    var body: some View {
        NavigationStack(path: $router.routes) {
            VStack(spacing: 24) {
                Image("img-welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .clipped()
                    .ignoresSafeArea(edges: .top)
                
                VStack(spacing: 12) {
                    Text("Punya masalah tentang elektronik?")
                        .font(.system(size: 36, weight: .black))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("color-alt-black"))
                    
                    Text("Perbaiki komponen elektronik Anda dengan Benerin Aja. Cepat, aman, dan tanpa ragu!")
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("color-alt-black"))
                        .padding(.horizontal)
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                
                Button(action: {
                    router.route(to: .signin(router))
                }) {
                    Text("Ayo Mulai!")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("color-primary"))
                        .cornerRadius(40)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .navigationDestination(for: Route.self) { $0 }
        }
    }
}

#Preview {
    OnboardingView()
}
