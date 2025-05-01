//
//  Voucher.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct Voucher: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String?
    var description: String?
    var details: String?
    var discount_percent: Int?
    var expired_date: Date?
    
    var customer_id: String?
    
    var is_active: Bool?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    @ServerTimestamp var used_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case details
        case discount_percent = "discount_percent"
        case expired_date = "expired_date"
         
        case customer_id = "customer_id"
        
        case is_active = "is_active"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
        case used_at = "used_at"
    }
}
