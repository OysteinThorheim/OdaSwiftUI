//
//  ContentView.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct ContentView: View, CartChange {
    
    @EnvironmentObject var order: OrderViewmodel
    
    func cartChange (item: Item, quantity: Int){
        
        if let index = getIndex(item: item){
            if  quantity > 0 {
                order.add(index: index)
            } else {
                order.remove(index: index)
            }
        }
        
    }
    
    func getIndex(item: Item) -> Int?{
    
        if order.items != nil{
            
            for i in 0 ..< Int(order.items!.count){
                if(order.items![i].product.id == item.product.id){
                    return i
                }
            }
        }
        return nil
    }
    
    var body: some View {
        NavigationView{
        List {
            
            ForEach(order.items ?? [], id: \.self.product.id) { section in

                ItemRow(item: section, cartChange: self)
                
            }
        }.navigationTitle("Nettbutikk")
                .listStyle(GroupedListStyle())
        }
        .phoneStackNavigationView()
        .iPadStackNavigationView()
    }
    
 }

extension View {
    func phoneStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(.stack))
        } else {
            return AnyView(self)
        }
    }
}

extension View {
    func iPadStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return AnyView(self.navigationViewStyle(.stack))
        } else {
            return AnyView(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }

