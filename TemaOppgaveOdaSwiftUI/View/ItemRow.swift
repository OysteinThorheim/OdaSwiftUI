//
//  ItemRow.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemRow: View {
    
    @EnvironmentObject var order: OrderViewmodel
    var item: Item
    var cartChange: CartChange
    var body: some View {
        
        HStack{
            
            NavigationLink(destination: ItemDetail(item: item.product)){
                
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
                    
                }
            }
            HStack{
                
                if (item.quantity > 1){
                    
                    Button(action: {
                        cartChange.cartChange(item: item, quantity: -1)
                    }) {
                        Image("minus-circle-fill")
                            .foregroundColor(Color.odaOrange)
                    }
                    Text("\(item.quantity-1)")
                }
                
                Button(action: {
                    cartChange.cartChange(item: item, quantity: +1)
                }) {
                    Image("plus-circle-fill")
                        .foregroundColor(Color.odaOrange)
                }
            }.font(.headline).buttonStyle(BorderlessButtonStyle())
            
        }
        .buttonStyle(BorderlessButtonStyle())
    }
    
}
