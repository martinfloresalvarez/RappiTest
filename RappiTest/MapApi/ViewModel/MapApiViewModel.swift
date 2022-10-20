//
//  MoviesViewModel.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 16/10/22.
//

import Foundation

class MapApiViewModel {
  
  var refreshData = { () -> () in }
  
  var mapApi: [MapApi] = [] {
    didSet {
      refreshData()
    }
  }
  
  // MARK: Call Map App JSON

  func dataMapApi() {
    ApiManager.shared.getMapApi { (response) in
      self.mapApi = response
    } fail: {
      // manage error
    }
  }
}
