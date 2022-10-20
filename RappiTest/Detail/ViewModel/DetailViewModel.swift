//
//  MovieDetailViewModel.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 17/10/22.
//

import Foundation

class DetailViewModel {
  
  var refreshData = { () -> () in }
  
  var parameters = [String: Any]()
  
  var dataModel: [Detail] = [] {
    didSet {
      refreshData()
    }
  }

  // MARK: Call API REST

  func getDataModel() {
    ApiManager.shared.getMovieDetail(parameters: parameters) { (response) in
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
