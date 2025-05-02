//
//  Order+Helpers.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI

enum OrderStatus: String, Codable {
    case wait = "Menunggu"
    case process = "Diproses"
    case finish = "Selesai"
    case cancel = "Dibatalkan"
}

enum Brand: String, Codable {
    case toshiba = "Toshiba"
    case samsung = "Samsung"
    case lg = "LG"
    case sony = "Sony"
    case sharp = "Sharp"
    case panasonic = "Panasonic"
    case msi = "MSI"
    case lenovo = "Lenovo"
    case aqua = "Aqua Japan"
    case sanyo = "sanyo"
    case axioo = "Axioo"
}
