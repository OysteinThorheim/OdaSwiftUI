//
//  OrderView.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: OrderViewmodel
    
    var body: some View {
        NavigationView {
            List {
//                Section{
//                    ForEach(order.items) { item in
//                        HStack{
//                            Text(item.name)
//                            Spacer()
//                            Text("\(item.gross_price, specifier: "%.2f")Kr")
//                        }
//                    }.onDelete(perform: deleteItems)
//                }
                
                Section{
                    NavigationLink(destination: CheckoutView()){
                        Text("Send bestilling")
                    }
                }//.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Bestilling")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
//
//    func deleteItems(at offsets: IndexSet){
//        order.items.remove(atOffsets: offsets)
//    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = OrderViewmodel()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
