//
//  InboxScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct InboxScreenView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top,10)
                Text("Inbox")
                    .font(.system(size: 20, weight: .black))
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 30)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }
            .padding()
            .background(Color("color-primary"))
            .ignoresSafeArea(.all)
            .frame(height: 130)
            .foregroundColor(.white)

            Spacer()

            VStack(spacing: 20) {
                Image("empty-box")
                    .resizable()
                    .frame(width: 342, height: 228)
                Text("Belum Ada Inbox Hari Ini")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
            }

            Spacer()
        }
        .background(Color(red: 0.96, green: 0.98, blue: 1.0))
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    InboxScreenView()
}

