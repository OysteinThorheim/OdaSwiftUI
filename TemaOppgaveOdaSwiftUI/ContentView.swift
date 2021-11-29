//
//  ContentView.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var order = OrderViewmodel()
    
   // let menu = Bundle.main.decode([Items].self, from: "products.json")
    
    var body: some View {
        NavigationView{
        List {
            //Section name (breakfast etc)
            ForEach(order.items ?? [], id: \.self.product.id) { section in
               // Section(header: Text(section.name)){
                //Section name (breakfast etc)
                    
                
                ItemRow(item: section.product)
//                  ForEach(section.items){ item in
//                      ItemRow(item: item)
                    
//                }
                
            
            
            }
        }.navigationTitle("Nettbutikk")
                .listStyle(GroupedListStyle())
        }
    }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }

