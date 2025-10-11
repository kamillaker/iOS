//
//  CartItem.swift
//  Lab 3
//
//  Created by Kamilla Kerimbayeva on 11.10.2025.
//

import Foundation


struct CartItem {
let product: Product
private(set) var quantity: Int


var subtotal: Double {
return product.price * Double(quantity)
}


init(product: Product, quantity: Int) {
self.product = product
self.quantity = max(1, quantity)
}


mutating func updateQuantity(_ newQuantity: Int) {
guard newQuantity > 0 else {
print("Invalid quantity. Must be > 0.")
return
}
quantity = newQuantity
}


mutating func increaseQuantity(by amount: Int) {
guard amount > 0 else { return }
quantity += amount
}
}
