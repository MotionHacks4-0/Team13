//
//  User.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct Customer: Codable, Identifiable {
    @DocumentID var id: String?
    var alamat_id: String?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        
        case alamat_id = "alamat_id"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
