//
//  SignUpScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 30/04/25.
//

import SwiftUI

struct SignUpScreenView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var verificationCode = ""
    @State private var password = ""
    @State private var agreedToTerms = false

    var body: some View {
        ZStack(alignment: .top) {
            Color("color-primary")
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Button(action: {}) {
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
                    Text("Daftar")
                        .font(.system(size: 27.74, weight: .bold))
                        .foregroundColor(Color("color-primary"))

                    TextField("Nama Lengkap", text: $fullName)
                        .padding()
                        .frame(height: 42)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5))
                        )

                    ZStack {
                        TextField("Email", text: $email)
                            .padding()
                            .frame(height: 42)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )

                        HStack {
                            Spacer()
                            Button("Kirim Kode") {}
                                .font(.system(size: 10))
                                .frame(height: 15)
                                .frame(width: 80)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color("color-primary"))
                                .foregroundColor(.white)
                                .cornerRadius(6)
                                .padding(.trailing, 10)
                        }
                    }

                    TextField("Kode Verifikasi", text: $verificationCode)
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

                    Button(action: {}) {
                        Text("DAFTAR")
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
                    .padding(.bottom, 10)

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
    }
}

// RoundedCorner & CheckboxToggleStyle tetap sama
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(.blue)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SignUpScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreenView()
    }
}
