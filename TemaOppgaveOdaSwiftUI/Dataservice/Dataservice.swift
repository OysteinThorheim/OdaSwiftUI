//
//  Decoder.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

//import UIKit
//


import Foundation

enum CustomFailures: Error {
    case URLFormationFailed
    case FailedToLoadData
}

struct Dataservice{
    
    func fetchItems(urlString:URL, completion: @escaping (Result<GroceryItems?, Error>) -> Void){
        URLSession(configuration: .default).dataTask(with: urlString){ data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                if let items = parseJson(jsonData: data){
                    completion(.success(items))
                } else {
                    completion(.failure(CustomFailures.FailedToLoadData))
                }
            }
        }.resume()
    }
    func parseJson(jsonData:Data) -> GroceryItems?{
        do {
            let decoder = JSONDecoder()
            let items = try decoder.decode(GroceryItems.self, from: jsonData)
            print(items.items.count)
            return items
        } catch {
            print("Decode error")
            return nil
        }
    }
}
