//
//  AppState.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI
import FirebaseAuth

final class AppState: ObservableObject {
    static let shared = AppState()
    
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    private init() {
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.isAuthenticated = true
                print("Auth state changed, is signed in")
            } else {
                self.isAuthenticated = false
                print("Auth state changed, is signed out")
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            self.isAuthenticated = false
        }catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
