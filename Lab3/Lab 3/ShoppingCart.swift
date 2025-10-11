//
//  ShoppingCart.swift
//  Lab 3
//
//  Created by Kamilla Kerimbayeva on 11.10.2025.
//
import Foundation


class ShoppingCart {
private(set) var items: [CartItem]
var discountCode: String?


init(items: [CartItem] = []) {
self.items = items
}


func addItem(product: Product, quantity: Int = 1) {
guard quantity > 0 else {
print("Quantity must be > 0")
return
}


// Check stock if present
if let stock = product.stockQuantity, stock < quantity {
print("Insufficient stock for product \(product.name)")
return
}


if let index = items.firstIndex(where: { $0.product.id == product.id }) {
var existing = items[index]
existing.increaseQuantity(by: quantity)
items[index] = existing
} else {
let newItem = CartItem(product: product, quantity: quantity)
items.append(newItem)
}
}


func removeItem(productId: String) {
items.removeAll { $0.product.id == productId }
}


func updateItemQuantity(productId: String, quantity: Int) {
if quantity <= 0 {
removeItem(productId: productId)
return
}
guard let index = items.firstIndex(where: { $0.product.id == productId }) else { return }
var updated = items[index]
updated.updateQuantity(quantity)
items[index] = updated
}


func clearCart() {
items.removeAll()
}


var subtotal: Double {
items.reduce(0) { $0 + $1.subtotal }
}


var discountAmount: Double {
guard let code = discountCode?.uppercased() else { return 0 }
switch code {
case "SAVE10":
return subtotal * 0.10
case "SAVE20":
return subtotal * 0.20
default:
return 0
}
}


var total: Double {
max(0, subtotal - discountAmount)
}


var itemCount: Int {
items.reduce(0) { $0 + $1.quantity }
}


var isEmpty: Bool {
items.isEmpty
}
}
