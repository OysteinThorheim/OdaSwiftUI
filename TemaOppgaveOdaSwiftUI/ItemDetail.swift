//
//  ItemDetail.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: OrderViewmodel
    var item: Product
    
    var body: some View {
        VStack{
            
            
            //ZStacken er for å legge tekst oppå bilde, trengs nok ikke
            ZStack(alignment:
                        .bottomTrailing){
            Image(item.mainImage)
//                Text("Photo: \(item.photoCredit)")
//                    .padding(4)
//                    .background(Color.black)
//                    .font(.caption)
//                    .foregroundColor(.white)
//                    .offset(x: -5, y: -5)
            }
            //ZStacken er for å legge tekst oppå bilde, trengs nok ikke
            
            
            Text(item.full_name) //Kan byttes med full name??
                .padding()
            
            Button ("Legg i handlevognen"){
               // self.order.add(item: self.item)
            }.font(.headline)
        
            
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline) //Mindre tittel at top
    }
}

struct ItemDetail_Previews: PreviewProvider {
    
    static let order = OrderViewmodel()
    
    static var previews: some View {
        NavigationView{
            ItemDetail(item: Product.example).environmentObject(order)
        }
    }
}
