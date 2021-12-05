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
                                Image(uiImage: item.product.images[0].thumbnail.url.getImageFromUrl())
                                    .resizable()
                                    .scaledToFit()
                                        .frame(width: 32.0, height: 32.0)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                
                            //Få bilde og få det til å legge seg til høyre for item name og price
                                
                                VStack(alignment: .leading) {
                                    Text(item.product.name)
                                        .font(.headline)
                                    Text("\(item.product.gross_price) kr")
                                }.layoutPriority(1) //Denne gjør at ingen items i lista kuttes eks: "Gresskar" blir "Gresska...", dersom det ikke skjer trengs den ikke
                                //Her legger vi kun på allergener i listeraden, ikke relevant
                                
                                Spacer()
                                
                                Text("\(item.quantity-1) Stk").font(.headline)
                                
                            }

                        }
                    }/*.onDelete(perform: deleteItems)*/
                }
                
                Section{
                    NavigationLink(destination: CheckoutView()){
                        Text("Send bestilling")
                    }
                }//.disabled(item.quantity=0)
            }
            .navigationBarTitle("Bestilling")
            .listStyle(GroupedListStyle())
            //.navigationBarItems(trailing: EditButton())
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
