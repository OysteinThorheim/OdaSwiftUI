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
    //dette er begynnelsen på å forsøkje å gjøre at nav-bar kun er synelig når det er items in cart, haha
    
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    if (order.total > 1){
                    Image(systemName: "list.dash")
                    Text("Menu")
                    }
                }
            
            OrderView()
                .tabItem{
                    if (order.total > 1){
                    Image(systemName: "cart")
                    Text(String(format: "%.2f kr", order.total))
//                    Text("Total \(order.total, specifier: "%.2f")Kr")
                    }
                }
        }
    }
}

//struct AppView_Previews: PreviewProvider {
//    static let order = OrderViewmodel()
//    
//    static var previews: some View {
//        AppView().environmentObject(order)
//    }
//}
