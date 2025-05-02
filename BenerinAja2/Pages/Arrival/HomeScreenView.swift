//
//  HomeScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 30/04/25.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 1) {
                Image("logo-dark-2")
                    .resizable()
                    .frame(width: 250, height: 230)

                Text("BenerinAja")
                    .font(.system(size: 47.87, weight: .bold, design: .default))
                    .foregroundColor(Color("color-primary"))
                    .padding(.bottom, 8)
            }
            VStack(spacing: 2) {
                Text("Elektronik Rusak? BenerinAja!")
                Text("Service Elektronik Cepat, Aman, Beres, Tanpa Ribet")
            }
            .font(.system(size: 13, weight: .regular, design: .default))
            
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.horizontal)

            Spacer()

            Button(action: {

            }) {
                Text("MULAI")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("color-primary"))
                    .cornerRadius(40)
            }
            .padding(.horizontal)

            Button(action: {
            }) {
                Text("AKU SUDAH PUNYA AKUN")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(Color("color-primary"))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("color-primary"), lineWidth: 2)
                    )
            }
            .padding([.horizontal, .top])
            
            Spacer().frame(height: 30)
        }
        .padding()
    }
}

#Preview {
    HomeScreenView()
}
