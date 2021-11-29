//
//  ItemRow.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct ItemRow: View {
    //Farge på alergener, ikke relevant
    
    //static let colors: [String: Color] = ["D": . purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    //Farge på alergener, ikke relevant
    
    @EnvironmentObject var order: OrderViewmodel
    var item: Product
    
    var body: some View {
        
        HStack{
    
        NavigationLink(destination: ItemDetail(item: item)){
        
        //Få bilde og få det til å legge seg til høyre for item name og price
            
        HStack{
            Image(item.thumbnailImage)
                .resizable()
                    .frame(width: 32.0, height: 32.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
        //Få bilde og få det til å legge seg til høyre for item name og price
            
            VStack(alignment: .leading) {
            Text(item.name)
                    .font(.headline)
                Text("\(item.gross_price) kr")
            }.layoutPriority(1) //Denne gjør at ingen items i lista kuttes eks: "Gresskar" blir "Gresska...", dersom det ikke skjer trengs den ikke
            //Her legger vi kun på allergener i listeraden, ikke relevant
            Spacer()
            
    
            
            //Her legger vi kun på allergener i listeraden, ikke relevant
            
//            ForEach (item.restrictions, id: \.self) { restriction in
//                Text(restriction)
//                    .font(.caption)
//                    .fontWeight(.black)
//                    .padding(5)
//                    .background(Self.colors[restriction, default: .black])
//                    .clipShape(Circle())
//                    .foregroundColor(.white)
//            }
            //Her legger vi kun på allergener i listeraden, ikke relevant
        }
        }
            HStack{
            Button(action: {
//                self.order.remove(item: self.item)
            }) {
                Image("minus-circle-fill")
                    .foregroundColor(Color("oda-orange"))
            }
            
            Button(action: {
//                self.order.add(item: self.item)
            }) {
                Image("plus-circle-fill")
                    .foregroundColor(Color("oda-orange"))
            }
            }.font(.headline).buttonStyle(BorderlessButtonStyle())
            
        }
        .buttonStyle(BorderlessButtonStyle())
        
      } //Hele Hstacken og VStacken plasseres i navigation link for å navigere til "Details"
    
}

struct ItemRow_Previews: PreviewProvider {
    static let order = OrderViewmodel()
    
    static var previews: some View {
        ItemRow(item: Product.example)
    }
}
