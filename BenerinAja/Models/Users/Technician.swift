//
//  Technician.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI
import FirebaseFirestore

struct Technician: Codable, Identifiable {
    @DocumentID var id: String?
    var bio: String?
    var experience: Double?
    var total_reviews: Int?
    var average_rating: Double?
    var location: GeoPoint?
    var specialist: [String]?
    var albums: [String]?
    
    var service_id: [String]?
    
    var is_active: Bool?
    var is_verified: Bool?
    
    @ServerTimestamp var created_at: Timestamp?
    @ServerTimestamp var updated_at: Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case id
        case bio
        case experience
        case total_reviews = "total_reviews"
        case average_rating = "average_rating"
        case location
        case specialist
        case albums
        
        case service_id = "service_id"
        
        case is_active = "is_active"
        case is_verified = "is_verified"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
