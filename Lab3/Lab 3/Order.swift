//
//  Order.swift
//  Lab 3
//
//  Created by Kamilla Kerimbayeva on 11.10.2025.
//

import Foundation


struct Order {
let orderId: String
let items: [CartItem]
let subtotal: Double
let discountAmount: Double
let total: Double
let timestamp: Date
let shippingAddress: Address


init(from cart: ShoppingCart, shippingAddress: Address) {
self.orderId = UUID().uuidString
// Make a copy of items (CartItem is a struct, so it's already a copy)
self.items = cart.items
self.subtotal = cart.subtotal
self.discountAmount = cart.discountAmount
self.total = cart.total
self.timestamp = Date()
self.shippingAddress = shippingAddress
}


var itemCount: Int {
items.reduce(0) { $0 + $1.quantity }
}
}
