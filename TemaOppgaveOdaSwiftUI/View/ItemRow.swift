//
//  ItemRow.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct ItemRow: View {
    
    @EnvironmentObject var order: OrderViewmodel
    var item: Item
    var cartChange: CartChange
    var body: some View {
        
        HStack{
    
            NavigationLink(destination: ItemDetail(item: item.product)){
            
        HStack{
            Image(uiImage: item.product.images[0].thumbnail.url.getImageFromUrl())
                .resizable()
                .scaledToFit()
                    .frame(width: 32.0, height: 32.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(item.product.name)
                    .font(.headline)
                Text("\(item.product.gross_price) kr")
            }.layoutPriority(1) //Denne gjør at ingen items i lista kuttes eks: "Gresskar" blir "Gresska...", dersom det ikke skjer trengs den ikke
            //Her legger vi kun på allergener i listeraden, ikke relevant
            Spacer()
            
        }
        }
            HStack{
                
                if (item.quantity > 1){
                
            Button(action: {
                cartChange.cartChange(item: item, quantity: -1)
            }) {
                Image("minus-circle-fill")
                    .foregroundColor(Color("oda-orange"))
            }
                    Text("\(item.quantity-1)")
                }
            
            Button(action: {
                cartChange.cartChange(item: item, quantity: +1)
            }) {
                Image("plus-circle-fill")
                    .foregroundColor(Color("oda-orange"))
            }
            }.font(.headline).buttonStyle(BorderlessButtonStyle())
            
        }
        .buttonStyle(BorderlessButtonStyle())
        
      } //Hele Hstacken og VStacken plasseres i navigation link for å navigere til "Details"
    
}

//struct ItemRow_Previews: PreviewProvider, CartChange {
//    static let order = OrderViewmodel()
//
//    func cartChange (item: Item, quantity: Int){
//
//
//
//    }
//
//    static var previews: some View {
//        ItemRow(item: Product.example, cartChange: self as! CartChange)
//    }
//}
