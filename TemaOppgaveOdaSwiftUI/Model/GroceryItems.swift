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
    
    
    //#if DEBUG
    //    static let example = Item(product: Product (id: Int(), full_name: "Gresskar Butternut Portugal/ Spania, 750 g",name:"Gresskar Butternut", name_extra: "Portugal/ Spania, 750 g",images:JsonImage(thumbnail: Large(url: "https://bilder.kolonial.no/produkter/d0083d5f-1101-4e7c-82e8-9f4210fdbd65.jpg?fit=max&w=500&s=f995d906632c729f4e00906118d5f900")),gross_price: "33.00",gross_unit_price: "44.00"),quantity: 1)
    //#endif
    
}
