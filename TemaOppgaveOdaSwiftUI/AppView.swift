//
//  AppView.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var order: OrderViewmodel
    
//    var totalPrice: Double {
//        let total = Double(order.total)
//        return total
//    }
    
   // @State private var itemsInCart = false
    
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            
            OrderView()
                .tabItem{
                    Image(systemName: "cart")
                 //   Text("Total \(totalPrice, specifier: "%.2f")Kr")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = OrderViewmodel()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
