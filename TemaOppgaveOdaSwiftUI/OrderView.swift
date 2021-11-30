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
                Section{
                    ForEach(order.items ?? [], id: \.self.product.id) { item in
                        if(item.quantity > 1){
                            HStack{
                                Text(item.product.name)
                                Spacer()
                                Text("\(item.quantity-1)")
                                Text("\(item.product.gross_price)Kr")
                            }
                        }
                    }/*.onDelete(perform: deleteItems)*/
                }
                
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

//    func deleteItems(at offsets: IndexSet){
//        order.items.remove(atOffsets: offsets)
//    }
//}

struct OrderView_Previews: PreviewProvider {
    static let order = OrderViewmodel()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
}
