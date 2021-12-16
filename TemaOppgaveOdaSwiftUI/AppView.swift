//
//  AppView.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var order: OrderViewmodel    
    
    var body: some View {
        
        if(order.total < 1) {
            ContentView()
        } else {
            TabView{
                ContentView()
                    .tabItem{
                        Image(systemName: "list.dash")
                        Text("Menu")
                    }
                OrderView()
                    .tabItem{
                        Image(systemName: "cart")
                        Text(String(format: "%.2f kr", order.total))
                    }
            }
        }
    }
}
