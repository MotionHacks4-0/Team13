//
//  Services.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct Service: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String?
    var description: String?
    var base_price: Double?
    
    var technician_id: String?
    var service_type_id: String?
    
    var is_available: Bool?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case base_price = "base_price"
        
        case technician_id = "technician_id"
        case service_type_id = "service_type_id"
        
        case is_available = "is_available"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
