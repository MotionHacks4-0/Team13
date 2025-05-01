//
//  Chat.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct TechnicianRoomChat: Codable, Identifiable {
    @DocumentID var id: String?
    var message: String?
    
    var user_name: String?
    var user_type: String?
    
    var user_id: String?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case message
        
        case user_name = "user_name"
        case user_type = "user_type"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
