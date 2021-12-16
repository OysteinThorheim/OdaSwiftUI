//
//  OrderView.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: OrderViewmodel
    
    var body: some View {
        NavigationView {
            List {
                Section{
                    ForEach(order.items ?? [], id: \.self.product.id) { item in
                        if(item.quantity > 1){
                            
                            HStack{
                                WebImage(url:URL(string: item.product.images[0].thumbnail.url))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32.0, height: 32.0)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.odaOrange, lineWidth: 2))
                                
                                VStack(alignment: .leading) {
                                    Text(item.product.name)
                                        .font(.headline)
                                    Text("\(item.product.gross_price) kr")
                                }.layoutPriority(1)
                                
                                Spacer()
                                
                                Text("\(item.quantity-1) Stk").font(.headline)
                                
                            }
                            
                        }
                    }
                }
                
                Section{
                    NavigationLink(destination: CheckoutView()){
                        Text("Send bestilling")
                    }
                }
            }
            .navigationBarTitle("Bestilling")
            .listStyle(GroupedListStyle())
        }
        .phoneStackNavigationView()
        .iPadStackNavigationView()
    }
    
    struct OrderView_Previews: PreviewProvider {
        static let order = OrderViewmodel()
        
        static var previews: some View {
            OrderView().environmentObject(order)
        }
    }
}


