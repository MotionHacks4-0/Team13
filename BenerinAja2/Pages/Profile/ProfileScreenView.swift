//
//  ProfileScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct ProfileScreenView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ZStack(alignment: .leading) {
                    Color("color-primary")
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 110)

                    HStack(alignment: .center) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)

                        Text("Profilku")
                            .font(.system(size: 20, weight: .black))
                            .foregroundColor(.white)
                            .padding(.leading, 8)

                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                }

                HStack(alignment: .center, spacing: 16) {
                    Image("profile")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Caldera")
                            .font(.headline)

                        Text("caldera123@gmail.com")
                            .foregroundColor(Color("color-primary"))
                            .font(.subheadline)

                        Text("0812345678910")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Image(systemName: "pencil")
                        .foregroundColor(Color("color-primary"))
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 1)
                .padding(.horizontal)

                SectionHeader(title: "Akun")
                VStack(spacing: 1) {
                    ProfileRow(title: "Ubah Kata Sandi", icon: "lock")
                    ProfileRow(title: "Bahasa", icon: "globe")
                    ProfileRow(title: "Langganan", icon: "building.2")
                    ProfileRow(title: "Jenis Pembayaran", icon: "creditcard")
                    ProfileRow(title: "Atur Akun", icon: "gearshape")
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 1)
                .padding(.horizontal)

                SectionHeader(title: "Info Lainnya")
                VStack(spacing: 1) {
                    ProfileRow(title: "Kebijakan Privasi", icon: "doc.text")
                    ProfileRow(title: "Ketentuan Layanan", icon: "doc.plaintext")
                    ProfileRow(title: "Beri Rating (V0.01)", icon: "star")
                    ProfileRow(title: "Costumer Service", icon: "headphones")
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 1)
                .padding(.horizontal)
            }
            .padding(.top, -16)
            .background(Color(.systemGroupedBackground))
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.subheadline)
            .bold()
            .foregroundColor(.gray)
            .padding(.horizontal)
    }
}

struct ProfileRow: View {
    let title: String
    let icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color("color-primary"))
                .frame(width: 24)
            Text(title)
                .foregroundColor(Color("color-primary"))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color("color-primary"))
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    ProfileScreenView()
}
