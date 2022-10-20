//
//  MoviesViewModel.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 16/10/22.
//

import Foundation

class TrailerViewModel {
  
  var refreshData = { () -> () in }
  var parameters = [String: Any]()
  var dataModel: [Trailer] = [] {
    didSet {
      refreshData()
    }
  }
  
  // MARK: Call API REST

  func data() {
    ApiManager.shared.getTrailer(parameters: parameters) { (response) in
      DispatchQueue.main.async {
        if response.statusCode == 37 || response.statusCode == 7 {
          // handle error API or source not found
          return
        }
        self.dataModel = [response]
      }
    } fail: {
      print("fail")
    }
    
  }
}
