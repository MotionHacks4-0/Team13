//
//  SplashScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 30/04/25.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color("color-primary")
                .edgesIgnoringSafeArea(.all)

            Image("logo-white")
                .resizable()
                .frame(width: 314, height: 290)
                .clipped()
            
            Spacer()
        VStack {
            Spacer()
            Text("Designed by Team 13 Motion Hack 4.0!")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, 20)}
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    SplashScreenView()
}
