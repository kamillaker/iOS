//
//  Address.swift
//  Lab 3
//
//  Created by Kamilla Kerimbayeva on 11.10.2025.
//
import Foundation


struct Address {
let street: String
let city: String
let zipCode: String
let country: String


var formattedAddress: String {
"\(street)\n\(city), \(zipCode)\n\(country)"
}
}

