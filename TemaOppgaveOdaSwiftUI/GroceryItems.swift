//
//  Menu.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

//import SwiftUI
//struct Items: Codable, Identifiable{
//    var id: Int
//    let items: [Product]
//
//}
//
//struct Product: Codable, Equatable, Identifiable {
//    let id: Int
//    let full_name: String
//    let name: String
//    let name_extra: String
//    let gross_price: Double
//    let gross_unit_price: String
//
//    var mainImage: String {
//            name.replacingOccurrences(of: " ", with: "-").lowercased()
//        }
//
//        var thumbnailImage: String {
//            "\(mainImage)-thumb"
//        }
//
//
//#if DEBUG
//    static let example = Product(id: Int(), full_name: "Gresskar Butternut Portugal/ Spania, 750 g",name:"Gresskar Butternut", name_extra: "Portugal/ Spania, 750 g",gross_price: Double(33.00),gross_unit_price: "44.00")
//#endif
//}

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

struct Product: Codable, Equatable {
    let id: Int
    let full_name: String
    let name: String
    let name_extra: String
    let gross_price: String
    let gross_unit_price: String
    
        var mainImage: String {
                name.replacingOccurrences(of: " ", with: "-").lowercased()
            }
    
            var thumbnailImage: String {
                "\(mainImage)-thumb"
            }
    
    enum CodingKeys: String, CodingKey {
        case id
        case full_name
        case name
        case name_extra
        case gross_price
        case gross_unit_price
        
        
        
    }
    
    
#if DEBUG
    static let example = Item(product: Product (id: Int(), full_name: "Gresskar Butternut Portugal/ Spania, 750 g",name:"Gresskar Butternut", name_extra: "Portugal/ Spania, 750 g",gross_price: "33.00",gross_unit_price: "44.00"),quantity: 1)
#endif
    
}
