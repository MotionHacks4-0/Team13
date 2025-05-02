//
//  OnboardingScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct OnboardingScreenView: View {
    var body: some View {
        NavigationStack {
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
                
                NavigationLink(destination: LoginScreenView()) {
                    HStack {
                        Image("google")
                            .resizable()
                            .frame(width: 18, height: 18)
                        
                        Text("Login with Google")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("color-primary"))
                    .cornerRadius(40)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

#Preview {
    OnboardingScreenView()
}
