//
//  SigninView.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject var authRepo: AuthRepo
    @StateObject var viewModel = SigninViewModel()
    @StateObject var router: AppRouter = .init()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Buat Akun")
                    .font(.system(size: 27.74, weight: .bold))
                    .foregroundColor(Color("color-primary"))
                
                TextField("Nama Lengkap", text: $viewModel.name)
                    .padding()
                    .frame(height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5))
                    )
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .frame(height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5))
                    )
                
                SecureField("Kata Sandi", text: $viewModel.password)
                    .padding()
                    .frame(height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5))
                    )
                
                Button {
                    Task {
                        viewModel.signInEmail {
                            router.route(to: .home(router))
                        }
                    }
                } label: {
                    Text("Buat Akun")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("color-primary"))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .buttonStyle(.borderedProminent)
                
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
                    Button {
                        Task {
                            viewModel.singInGoogle {
                                router.route(to: .home(router))
                            }
                        }
                    } label: {
                        Image("google")
                            .resizable()
                            .frame(width: 32, height: 32)
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
        .onAppear {
            viewModel.onAppear {
                router.route(to: .home(router))
            }
        }
        .navigationDestination(for: Route.self) { $0 }
    }
}


#Preview {
    SigninView()
}
