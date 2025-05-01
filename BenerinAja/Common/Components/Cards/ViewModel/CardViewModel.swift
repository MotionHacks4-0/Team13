//
//  CardViewModel.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

class CardViewModel: ObservableObject {
    var imageName: String
    var orderCode: String
    var orderDate: String
    var storeName: String
    var category: String
    var price: String

    init(imageName: String, orderCode: String, orderDate: String, storeName: String, category: String, price: String) {
        self.imageName = imageName
        self.orderCode = orderCode
        self.orderDate = orderDate
        self.storeName = storeName
        self.category = category
        self.price = price
    }
}
