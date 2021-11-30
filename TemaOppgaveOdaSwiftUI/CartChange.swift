//
//  CartChange.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 30/11/2021.
//

import Foundation


protocol CartChange {
    
    func cartChange (item: Item, quantity: Int)
}
