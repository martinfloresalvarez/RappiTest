//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import Foundation
import Alamofire
import Cache

class ServiceManager {
  
  public static let shared = ServiceManager()
  
  // MARK: API REST User Parameters
  
  let idioma = langApp()
  
  // MARK: Persistent Storage instance
  
  let diskConfig = DiskConfig(name: "Movies")
  let memoryConfig = MemoryConfig(expiry: .never, countLimit: 10, totalCostLimit: 10)
  
  func callService<T: Codable>(urlString: String, parameters: [String: Any], success: @escaping ((T) -> Void), fail: @escaping(() -> Void)) {
    
    // Joim user parameters / POST / GET
    var animDictionary: [String: Any] = [:]
    animDictionary["idioma"] = idioma
    animDictionary.merge(parameters) {(current, _ ) in current}
    
    // Is offline
    if !Connectivity.isOnline() {
      let storage = try? Storage<String, T>(
        diskConfig: self.diskConfig,
        memoryConfig: self.memoryConfig,
        transformer: TransformerFactory.forCodable(ofType: T.self) // Storage<String, User>
      )
      
      if let entry = try? storage?.entry(forKey: urlString) {
        success(entry.object)
      }
      fail()
    }
    
    // Request
    AF.request(urlString, method: .get, parameters: animDictionary).responseDecodable(decoder: JSONDecoder()) { (response: DataResponse<T, AFError>) in
      if let data = response.data {
        
        do {
          if let jsonString = String(data: data, encoding: .utf8) {
            // debugg JSON response
            print("success \(jsonString)")
          }
          
          let decoded = try JSONDecoder().decode(T.self, from: data)
          
          // Set Persistent Storage
          let storage = try? Storage<String, T>(
            diskConfig: self.diskConfig,
            memoryConfig: self.memoryConfig,
            transformer: TransformerFactory.forCodable(ofType: T.self) // Storage<String, User>
          )
          do {
            let user = try JSONDecoder.decode(data, to: T.self)
            try storage?.setObject(user, forKey: urlString)
          } catch {
            print(error)
          }
          
          success(decoded)
        } catch {
          print("Error al decodificar JSON \(String(describing: error))")
          fail()
        }
      }
    }
  }
}

// MARK: Check Connection Method

class Connectivity {
  class func isOnline() -> Bool {
    // Debug
    print("estado \(NetworkReachabilityManager()!.isReachable)")
    return NetworkReachabilityManager()!.isReachable
  }
}
