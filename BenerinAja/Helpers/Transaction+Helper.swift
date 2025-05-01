//
//  Transaction+Helper.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import SwiftUI

enum TransactionType: String, Codable {
    case topup = "Top Up"
    case dp = "DP"
    case full = "Lunas"
}

enum PaymentMethod: Codable {
    case ewallet(Ewallet)
    case qris
    case transfer(Transfer)
}

enum Transfer: String, Codable {
    case bca = "BCA"
    case mandiri = "Mandiri"
    case bni = "BNI"
}

enum Ewallet: String, Codable {
    case gopay = "Gopay"
}
