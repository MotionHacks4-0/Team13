//
//  CardHistoryViewModel.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 02/05/25.
//

import SwiftUI

class CardHistoryViewModel: ObservableObject {
    var imageName: String
    var orderCode: String
    var date: String
    var storeName: String
    var category: String
    var price: String
    var isPaid: Bool
    
    init(imageName: String, orderCode: String, date: String, storeName: String, category: String, price: String, isPaid: Bool) {
        self.imageName = imageName
        self.orderCode = orderCode
        self.date = date
        self.storeName = storeName
        self.category = category
        self.price = price
        self.isPaid = isPaid
    }
}
