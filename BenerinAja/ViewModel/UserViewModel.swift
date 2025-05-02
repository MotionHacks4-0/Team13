//
//  UserViewModel.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Combine
import GoogleSignIn
import FirebaseCore
import AuthenticationServices

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showError = false
    
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var phoneNumber = ""
    @Published var bornDate = Date()
    @Published var defaultPronouns: User.Pronouns = .he
    
    private var cancellables = Set<AnyCancellable>()
    internal let db = Firestore.firestore()
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            self.isAuthenticated = user != nil
            if let user = user {
                self.fetchUserData(userId: user.uid)
            } else {
                self.currentUser = nil
            }
        }
    }
    
    func signInWithEmail() {
        guard validateSignUpForm() else { return }
        
        isLoading = true
        errorMessage = nil
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            self.isLoading = false
            
            if let error = error {
                self.handleError(error)
                return
            }
            
            guard let authResult = result else {
                self.handleError(NSError(domain: "No auth result", code: 0))
                return
            }
            
            self.createUser(userId: authResult.user.uid, email: email, displayName: name, username: "", password: password, photoURL: nil)
        }
    }
    
    func loginWithEmail() {
        guard validateLoginForm() else { return }
        
        isLoading = true
        errorMessage = nil
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            self.isLoading = false
            
            if let error = error {
                self.handleError(error)
                return
            }
            
            guard let authResult = result else {
                self.handleError(NSError(domain: "No auth result", code: 0))
                return
            }
            
            self.fetchUserData(userId: authResult.user.uid)
        }
    }
    
    func signInWithGoogle() {
        isLoading = true
        errorMessage = nil
        
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            handleError(NSError(domain: "GoogleSignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: "Firebase client ID tidak ditemukan"]))
            isLoading = false
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        
        GIDSignIn.sharedInstance.signIn(
            with: config,
            presenting: rootViewController
        ) { [weak self] user, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.handleError(error)
                }
                
                return
            }
            
            guard let idToken = user?.authentication.idToken else {
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.handleError(NSError(domain: "GoogleSignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: "ID Token tidak ditemukan"]))
                }
                return
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user!.authentication.accessToken
            )
            
            Auth.auth().signIn(with: credential) { [weak self] authResult, error in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    if let error = error {
                        self.handleError(error)
                        return
                    }
                    
                    guard let authResult = authResult else {
                        self.handleError(NSError(domain: "FirebaseAuth", code: -1, userInfo: [NSLocalizedDescriptionKey: "Autentikasi gagal"]))
                        return
                    }
                    
                    self.checkIfUserExists(
                        userId: authResult.user.uid,
                        email: authResult.user.email,
                        displayName: authResult.user.displayName,
                        username: "",
                        password: "",
                        photoURL: authResult.user.photoURL
                    )
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
            currentUser = nil
            self.clearForm()
        } catch {
            self.handleError(error)
        }
    }
}

extension UserViewModel {
    public func createUser(userId: String, email: String?, displayName: String?, username: String?, password: String?,  photoURL: URL?) {
        let newUser = User(
            id: userId,
            name: displayName ?? "Customer BenerinAja",
            username: username,
            pronouns: User.Pronouns.he,
            email: email ?? "",
            password: password ?? "",
            phone_number: nil,
            born_date: nil,
            profile_img: photoURL?.absoluteString
        )
        
        do {
            try db.collection("users").document(userId).setData(from: newUser)
            fetchUserData(userId: userId)
        } catch {
            isLoading = false
            handleError(error)
        }
    }
    
    public func fetchUserData(userId: String) {
        db.collection("users").document(userId).getDocument { [weak self] document, error in
            guard let self = self else { return }
            
            self.isLoading = false
            
            if let error = error {
                self.handleError(error)
                return
            }
            
            guard let document = document, document.exists else {
                if Auth.auth().currentUser != nil {
                    self.createUser(userId: userId, email: email, displayName: name, username: "", password: password, photoURL: nil)
                }
                return
            }
            
            do {
                let user = try document.data(as: User.self)
                DispatchQueue.main.async {
                    self.currentUser = user
                }
            } catch {
                self.handleError(error)
            }
        }
    }
}
