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
                Image(uiImage: item.images[0].thumbnail.url.getImageFromUrl())
                    .resizable()
                    .scaledToFit()
                Text(item.name)
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            //ZStacken er for å legge tekst oppå bilde, trengs nok ikke
            //Text(item.name)
            Text(item.full_name)
                .font(.headline)
            Text("Pris: \(item.gross_price) kr")
                .font(.headline)
                .padding()
            
            
            
//            Button ("Legg i handlevognen"){
//               // self.order.add(item: self.item)
//            }.font(.headline)
        }.navigationBarTitle(Text(item.name), displayMode: .inline) //Mindre tittel at top
    }
}

//struct ItemDetail_Previews: PreviewProvider {
//    
//    static let order = OrderViewmodel()
//    
//    static var previews: some View {
//        NavigationView{
//            ItemDetail(item: Product.example).environmentObject(order)
//        }
//    }
//}
