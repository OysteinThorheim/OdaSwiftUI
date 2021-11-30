//
//  Decoder.swift
//  TemaOppgaveOdaSwiftUI
//
//  Created by Øystein Thorheim on 23/11/2021.
//

//import UIKit
//
//extension Bundle {
//    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//
//        let decoder = JSONDecoder()
//
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//
//        return loaded
//    }
//}

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
