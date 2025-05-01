//
//  Address.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct Address: Codable, Identifiable {
    @DocumentID var id: String?
    var customer_name: String?
    var customer_phone_number: String?
    var address_type: String?
    var province: String?
    var street: String?
    var details: String?
    var postal_code: Int?
    
    var is_default: Bool?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case customer_name = "customer_name"
        case customer_phone_number = "customer_phone_number"
        case address_type = "address_type"
        case province
        case street
        case details
        case postal_code = "postal_code"
        
        case is_default = "is_default"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
