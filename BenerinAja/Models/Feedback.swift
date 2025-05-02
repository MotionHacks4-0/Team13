//
//  Feedback.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct Feedback: Codable, Identifiable {
    @DocumentID var id: String?
    var comment: String
    var rating: Int
    var count_usefull: Int?
    
    var customer_id: String?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys:String, CodingKey {
        case id
        case comment
        case rating
        case count_usefull = "count_usefull"
        
        case customer_id = "customer_id"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
