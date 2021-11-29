//
//  TemaOppgaveOdaSwiftUIApp.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

import SwiftUI

@main

struct TemaOppgaveOdaSwiftUIApp: App {
    var order = OrderViewmodel()
    
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order)
        }
    }
}
