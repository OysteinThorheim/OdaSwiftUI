//
//  Extensions.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 01/12/2021.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    static var odaOrange = Color("oda-orange")
}

extension String{
    
    func getImageFromUrl() -> UIImage {
        do{
            
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data:Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
            
        } catch{
            
        }
        return UIImage()
        
    }
}
