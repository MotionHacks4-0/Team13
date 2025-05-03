//
//  UserRepo.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI
import FirebaseFirestore

final class UserRepo {
    static let user = UserRepo()
    
    private init() { }
    
    private final let db = Firestore.firestore()
    
    func createCustomerUser(uid: String, name: String, username: String, email: String, password: String, phone_number: String, born_date: String, profile_img: String, alamat_id: String, completion: @escaping (Error?) -> Void) {
        let user = User(
            id: uid,
            name: name,
            username: username,
            pronouns: User.Pronouns.he,
            email: email,
            password: password,
            phone_number: phone_number,
            born_date: born_date,
            profile_img: profile_img
        )
        
        let customer = Customer(
            id: uid,
            alamat_id: alamat_id
        )
        
        do {
            try db.collection("users").document(uid).setData(from: user)
            try db.collection("customers").document(uid).setData(from: customer)
            completion(nil)
        } catch {
            completion(error)
        }
        
    }
    
    func createTechnicianUser() {
        
    }
}

