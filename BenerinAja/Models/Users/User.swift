//
//  User.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct User {
    @DocumentID var id: String?
    var name: String?
    var username: Pronouns?
    var pronouns: String?
    var email: String?
    var password: String?
    var phone_number: String?
    var born_date: Date?
    var profile_img: String?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum Pronouns: String, Codable {
        case he = "his"
        case her = "her"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
        case password
        case phone_number = "phone_number"
        case born_date = "born_date"
        case profile_image = "profile_image"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
