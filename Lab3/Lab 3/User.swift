//
//  User.swift
//  Lab 3
//
//  Created by Kamilla Kerimbayeva on 11.10.2025.
//
import Foundation


class User {
let userId: String
let name: String
let email: String
private(set) var orderHistory: [Order]


init(userId: String = UUID().uuidString, name: String, email: String) {
self.userId = userId
self.name = name
self.email = email
self.orderHistory = []
}


func placeOrder(_ order: Order) {
orderHistory.append(order)
}


var totalSpent: Double {
orderHistory.reduce(0) { $0 + $1.total }
}
}
