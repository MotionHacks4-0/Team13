//
//  AuthEmailRepo.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI
import FirebaseAuth

final class AuthRepo: ObservableObject {
    func loginWithEmail(email:String, password:String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
            if let e = error {
                completion(e)
            } else {
                print("Login success")
                completion(nil)
            }
        }
    }
    
    func signinWithEmail(email: String, password: String, name: String, role: String = "customer", completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
                
            } else if let user = authResult?.user {
                print("Successfully created password account")
                
                if role.contains("customer") {
                    UserRepo.user.createCustomerUser(uid: user.uid, name: name, username: "", email: email, password: password, phone_number: "", born_date: "", profile_img: "", alamat_id: "") { error in
                        if let e = error {
                            print("There's an error \(e.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
}
