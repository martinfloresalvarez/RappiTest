//
//  MoviesViewModel.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 16/10/22.
//

import Foundation

class MoviesViewModel {
  
  var refreshData = { () -> () in }
  
  var parameters = [String: Any]()
  
  var dataModel: [Movies] = [] {
    didSet {
      refreshData()
    }
  }

  // MARK: Call API REST

  func getDataModel() {
    ApiManager.shared.getMovies(parameters: parameters) { (response) in
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
