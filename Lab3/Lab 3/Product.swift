//
//  Product.swift
//  Lab 3
//
//  Created by Kamilla Kerimbayeva on 11.10.2025.
//

import Foundation


struct Product: Equatable {
let id: String
let name: String
let price: Double
let category: Category
let description: String
var stockQuantity: Int?


enum Category: String {
case electronics
case clothing
case food
case books
}


var displayPrice: String {
String(format: "$%.2f", price)
}


// Failable initializer: returns nil if price is not positive
init?(id: String = UUID().uuidString,
name: String,
price: Double,
category: Category,
description: String = "",
stockQuantity: Int? = nil) {
guard price > 0 else { return nil }
if let s = stockQuantity, s < 0 { return nil }


self.id = id
self.name = name
self.price = price
self.category = category
self.description = description
self.stockQuantity = stockQuantity
}
}
