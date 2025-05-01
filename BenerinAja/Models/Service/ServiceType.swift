//
//  Category.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct ServiceType: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String?
    var description: String?
    var icon_img: String?
    
    var is_active: Bool?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case icon_img = "icon_img"
        
        case is_active = "is_active"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
