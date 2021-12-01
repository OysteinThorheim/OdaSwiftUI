//
//  Order.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

class OrderViewmodel: ObservableObject {
   // @Published var items = [Product]()
    @Published var items:[Item]?
    @Published var total: Double = 0
    @Published var cartSize: Int = 0
    let dataservice:Dataservice = Dataservice()
    
    init(){
        loadCart()
    }
    
    

//    var total: Double {
//        if items.count > 0 {
//            return items.reduce(0) { $0 + $1.gross_price }
//        } else {
//            return 0
//        }
//    }
//
    func add(index:Int) {
       // items.append(item)

        //item.addQuantity(amount: quantity)
        
//        objectWillChange.send()
        self.items?[index].addQuantity(amount: 1)
        updateCart()
    }

    func remove(index: Int) {
        if(self.items![index].quantity > 1){
//            objectWillChange.send()
            self.items?[index].addQuantity(amount: -1)
            updateCart()
        }
    }
    
    func updateCart(){
        
        var cartSize: Int = 0
        var price: Double = 0.00
        
        guard let cart = self.items else {
            return
        }
        
        for item in cart {
            
            if (item.quantity > 1) {
                cartSize += (item.quantity-1)
                price += (Double(item.product.gross_price)!) * (Double(item.quantity - 1))
            }
            
        }
//        objectWillChange.send()
        self.cartSize = cartSize
        self.total = price
        print(total)
        
    }
    
    
    
    func loadCart(){
        
        if let urlString = URL(string:
                                "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6"){
            dataservice.fetchItems(urlString: urlString){
                [weak self] result in
                self?.getItems(result: result)
            }
            
        } else{
            print ("fucking failure my dudes")
            
        }
        
    }
    
    
    
    private func getItems(result: Result<GroceryItems?, Error>){
        switch result {
        case .success(let items):
            DispatchQueue.main.async {
                [weak self] in
                self?.items = items?.items
            }
        case .failure(let error):
            print(error)
        }
    }
    
    
}
