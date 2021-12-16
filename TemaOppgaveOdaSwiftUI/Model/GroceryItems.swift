//
//  Menu.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct GroceryItems: Codable{
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Item: Codable{
    var product: Product
    var quantity: Int
    
    public mutating func addQuantity(amount:Int){
        self.quantity+=amount
    }
    
    enum CodingKeys: String, CodingKey {
        case product, quantity
    }
}

struct JsonImage: Codable {
    let thumbnail, large: Large
    
}

struct Large: Codable{
    let url: String
}

struct Product: Codable {
    let id: Int
    let full_name: String
    let name: String
    let name_extra: String
    let images:[JsonImage]
    let gross_price: String
    let gross_unit_price: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case full_name
        case name
        case name_extra
        case images
        case gross_price
        case gross_unit_price
        
    }    
}
