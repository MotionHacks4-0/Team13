//
//  TempChatRoom.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct TempTechnicianChat: Codable, Identifiable {
    @DocumentID var id: String?
    
    var userA_id: String?
    var userB_id: String?
    
    var is_active: Bool?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userA_id = "userA_id"
        case userB_id = "userB_id"
        
        case is_active = "is_active"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
