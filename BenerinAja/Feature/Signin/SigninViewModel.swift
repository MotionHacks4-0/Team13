//
//  SigninViewModel.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI

final class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var isShowAlert = false
    @Published var errorText = ""
    
    private let authRepo = AuthRepo()
    
    @MainActor
    func signInEmail(routing: @escaping () -> Void) {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorText = "Semua kolom harus diisi."
            isShowAlert = true
            return
        }
        
        guard password == confirmPassword else {
            errorText = "Password dan konfirmasi tidak cocok."
            isShowAlert = true
            return
        }
        
        authRepo.signinWithEmail(email: email, password: password, name: name, role: "") { error in
            if let e = error {
                print("There's an error \(e.localizedDescription)")
            }
        }
    }
    
    @MainActor
    func singInGoogle(routing: @escaping () -> Void) {
        
    }
    
    @MainActor
    func onAppear(routing: @escaping () -> Void) {
        if AppState.shared.isAuthenticated {
            routing()
        }
    }
}
