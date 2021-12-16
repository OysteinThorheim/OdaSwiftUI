//
//  ItemDetail.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: OrderViewmodel
    var item: Product
    
    var body: some View {
        VStack{
            
            ZStack(alignment:
                        .bottomTrailing){
                WebImage(url:URL(string: item.images[0].thumbnail.url))
                    .resizable()
                    .scaledToFit()
                Text(item.name)
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.full_name)
                .font(.headline)
            Text("Pris: \(item.gross_price) kr")
                .font(.headline)
                .padding()
            
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
