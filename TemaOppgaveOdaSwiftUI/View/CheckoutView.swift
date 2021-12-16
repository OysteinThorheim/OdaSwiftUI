//
//  CheckoutView.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: OrderViewmodel
    
    static let paymentTypes = [ "Debitkort", "Kredittkort", "Paypal"]
    @State private var paymentType = 0
    @State private var addcuponDetails = false
    @State private var cuponcode = ""
    @State private var showingPaymentAlert = false
    
    //Rabattkode? Få 10% rabatt på din bestilling med rabattkoden "Konstan10n"
    var totalPrice: Double {
        let total = cuponcode == "Konstan10n" ? order.total / 100 * 90  : Double(order.total)
        return total
    }
    
    var body: some View {
        Form {
            Section{
                Picker("Betalingsmåte:", selection:
                        $paymentType){
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addcuponDetails.animation()){
                    Text("Bruk rabattkode")
                }
                if addcuponDetails{
                    TextField("Tast inn rabattkode", text: $cuponcode)
                }
            }
            
            
            
            Section(header:
                        Text(String(format: "%.2f kr", totalPrice))
                        .font(.largeTitle)
            ){
                Button("Betal"){
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Betaling"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert (title: Text("Takk for bestillingen"), message:  Text("Totalen på din bestilling:\(totalPrice, specifier: "%.2f")Kr"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = OrderViewmodel()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
