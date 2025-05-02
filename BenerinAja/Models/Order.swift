//
//  Diagnose.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct Order: Codable, Identifiable {
    @DocumentID var id: String?
    var status: String
    
    var service_type: String?
    
    var order_request_id: String?
    var customer_id: String?
    var technisian_id: String?
    var chat_room_id: String?
    var feedback_id: String?
    var service_id: String?
    var transaction_id: String?
    
    var ordered_at: Date
    var ordered_time: Date
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        
        case service_type = "service_type"
        
        case order_request_id = "order_request_id"
        case customer_id = "customer_id"
        case technisian_id = "technisian_id"
        case chat_room_id = "chat_room_id"
        case feedback_id = "feedback_id"
        case service_id = "service_id"
        case transaction_id = "transaction_id"
        
        case ordered_at = "ordered_at"
        case ordered_time = "ordered_time"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
