//
//  UserViewModel+Helper.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI
import FirebaseFirestore

extension UserViewModel {
    public func validateSignUpForm() -> Bool {
        guard !email.isEmpty, !password.isEmpty, !name.isEmpty else {
            errorMessage = "Silahkan isi form yang diperlukan"
            showError = true
            return false
        }
        
        if !email.isValidEmail {
            errorMessage = "Format email tidak valid"
            showError = true
            return false
        }
        
        if !password.isValidPassword {
            errorMessage = "Password harus minimal 8 karakter, mengandung huruf besar, huruf kecil, angka, dan karakter spesial"
            showError = true
            return false
        }
        
        return true
    }
    
    public func validateLoginForm() -> Bool {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Silahkan isi form yang diperlukan"
            showError = true
            return false
        }
        
        return true
    }
    
    public func handleError(_ error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
            self.showError = true
            self.isLoading = false
        }
    }
    
    public func clearForm() {
        email = ""
        password = ""
        name = ""
        phoneNumber = ""
        bornDate = Date()
        defaultPronouns = .he
    }
    
    public func checkIfUserExists(userId: String, email: String?, displayName: String?, username: String?, password: String?, photoURL: URL?) {
        isLoading = true
        
        self.db.collection("users").document(userId).getDocument { [weak self] document, error in
            guard let self = self else { return }
            
            if let error = error {
                self.isLoading = false
                self.handleError(error)
                return
            }
            
            if document == nil || !document!.exists {
                self.createUser(userId: userId,
                                email: email,
                                displayName: displayName, username: username, password: password,
                                photoURL: photoURL
                )
            } else {
                self.fetchUserData(userId: userId)
            }
        }
    }
}
