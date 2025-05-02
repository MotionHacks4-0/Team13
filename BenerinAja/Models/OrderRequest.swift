//
//  OrderRequest.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct OrderRequest: Codable, Identifiable {
    @DocumentID var id: String?
    var service_type: String?
    
    var problem: [String]?
    var brand: String?
    
    var screen_size: Double?
    var drum_size: Double?
    var pk_size: Double?
    
    var is_connected: Bool?
    var is_need_cleaning: Bool?
    var is_damaged: Bool?
    
    var amount_to_fix_cctv: Int?
    var amount_to_fix_ac: Int?
    
    var order_id: String?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case service_type = "service_type"
        
        case problem
        case brand
        case screen_size = "screen_size"
        case drum_size = "drum_size"
        case pk_size = "pk_size"
        
        case is_connected = "is_connected"
        case is_need_cleaning = "is_need_cleaning"
        case is_damaged = "is_damaged"
        
        case amount_to_fix_cctv = "amount_to_fix_cctv"
        case amount_to_fix_ac = "amount_to_fix_ac"
        
        case order_id = "order_id"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
