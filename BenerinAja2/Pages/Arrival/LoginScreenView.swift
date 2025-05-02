//
//  LoginScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 30/04/25.
//

import SwiftUI

struct LoginScreenView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var verificationCode = ""
    @State private var password = ""
    @State private var agreedToTerms = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color("color-primary")
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 15, height: 23)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 40)
                        .padding(.top, 5)
                        Spacer()
                    }

                    Image("logo-white-2")
                        .resizable()
                        .frame(width: 188, height: 97)
                        .clipped()
                        .padding(.top, 5)
                        .padding(.bottom, 30)

                    VStack(spacing: 20) {
                        Text("Masuk")
                            .font(.system(size: 27.74, weight: .bold))
                            .foregroundColor(Color("color-primary"))

                        TextField("Nama Lengkap atau Email", text: $fullName)
                            .padding()
                            .frame(height: 42)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )

                        SecureField("Kata Sandi", text: $password)
                            .padding()
                            .frame(height: 42)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                // Handle forget password action
                            }) {
                                Text("Lupa Kata Sandi?")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color("color-primary"))
                            }
                        }
                        .padding(.bottom, 20)

                        NavigationLink(destination: DashboardScreenView()) { // Mengarahkan ke Dashboard
                            Text("MASUK")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("color-primary"))
                                .foregroundColor(.white)
                                .cornerRadius(30)
                        }

                        HStack(alignment: .top, spacing: 4) {
                            Toggle("", isOn: $agreedToTerms)
                                .toggleStyle(CheckboxToggleStyle())
                                .padding(.top, 2)

                            Text(.init("""
                            Dengan ini saya menyetujui [Syarat & Ketentuan](action://terms) serta [Kebijakan Privasi](action://privacy) aplikasi BenerinAja
                            """))
                            .font(.system(size: 11, weight: .regular))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .onOpenURL { url in
                                if url.absoluteString == "action://terms" {
                                    print("Syarat & Ketentuan tapped")
                                } else if url.absoluteString == "action://privacy" {
                                    print("Kebijakan Privasi tapped")
                                }
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 90)

                        HStack {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("color-primary"))
                            Text("Atau")
                                .foregroundColor(Color("color-primary"))
                                .font(.footnote)
                                .padding(.horizontal, 8)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("color-primary"))
                        }

                        HStack(spacing: 20) {
                            Button(action: {}) {
                                Image("google")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }

                            Button(action: {}) {
                                Image("facebook")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                            }

                            Button(action: {}) {
                                Image("apple")
                                    .resizable()
                                    .frame(width: 30, height: 35)
                            }
                        }
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.top, 5)
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .ignoresSafeArea(edges: .bottom)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}

