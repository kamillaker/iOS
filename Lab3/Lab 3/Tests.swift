//
//  Tests.swift
//  Lab 3
//
//  Created by Kamilla Kerimbayeva on 11.10.2025.
//

import Foundation
func main() {
    
    // 1. Create sample products
    let laptop = Product(name: "Laptop", price: 999.99, category: .electronics, description: "A fast laptop", stockQuantity: 5)!
    let book = Product(name: "Swift Programming", price: 29.99, category: .books, description: "Learn Swift")!
    let headphones = Product(name: "Headphones", price: 199.99, category: .electronics, description: "Noise cancelling")!
    
    
    // 2. Test adding items to cart
    let cart = ShoppingCart()
    cart.addItem(product: laptop, quantity: 1)
    cart.addItem(product: book, quantity: 2)
    
    
    // 3. Test adding same product twice (should update quantity)
    cart.addItem(product: laptop, quantity: 1)
    if let laptopItem = cart.items.first(where: { $0.product.id == laptop.id }) {
        assert(laptopItem.quantity == 2, "Laptop quantity should be 2")
    }
    
    
    // 4. Test cart calculations
    print("Subtotal: \(cart.subtotal)")
    print("Item count: \(cart.itemCount)")
    
    
    // 5. Test discount code
    cart.discountCode = "SAVE10"
    print("Total with discount: \(cart.total)")
    
    
    // 6. Test removing items
    cart.removeItem(productId: book.id)
    assert(cart.items.first(where: { $0.product.id == book.id }) == nil)
    
    
    // 7. Demonstrate REFERENCE TYPE behavior
    func modifyCart(_ cart: ShoppingCart) {
        cart.addItem(product: headphones, quantity: 1)
    }
    modifyCart(cart)
    assert(cart.items.contains { $0.product.id == headphones.id })
    
    
    // 8. Demonstrate VALUE TYPE behavior
    let item1 = CartItem(product: laptop, quantity: 1)
    var item2 = item1
    item2.updateQuantity(5)
    assert(item1.quantity == 1, "item1 should remain unchanged")
    assert(item2.quantity == 5, "item2 should be updated")
    
    
    // 9. Create order from cart
    let address = Address(street: "Al Farabi", city: "Almaty", zipCode: "050000", country: "KZ")
    let order = Order(from: cart, shippingAddress: address)
    
    
    // 10. Modify cart after order creation
    cart.clearCart()
    assert(order.itemCount > 0, "Order should keep original items")
    assert(cart.itemCount == 0, "Cart should be empty after clear")
    
    
    print("Order items count: \(order.itemCount)")
    print("Cart items count: \(cart.itemCount)")
    
    
    // Bonus: User and order history
    let user = User(name: "Kamilla", email: "kamilla@gmail.com")
    user.placeOrder(order)
    print("User total spent: \(user.totalSpent)")
}
