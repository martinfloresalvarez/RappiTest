//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import Foundation

// MARK: ULR API Debug

// https://api.themoviedb.org/3/movie/top_rated?api_key=dee176c8e98f0cade9b2cfe56e77baf2&language=es-MX
// https://api.themoviedb.org/3/movie/top_rated?api_key=dee176c8e98f0cade9b2cfe56e77baf2&language=es-MX&region=mx
// https://api.themoviedb.org/3/movie/top_rated?api_key=dee176c8e98f0cade9b2cfe56e77baf2&primary_release_date.gte=2020-01-01

import Cache

class ApiManager {

  public static let shared = ApiManager()
  
  // MARK: API REST Main Parameters
  
  let apiKey = ApiKeyTheMovie.develop.rawValue
  let versionApi = VersionApiTheMovie.latest.rawValue
  let lang = langApp()
  
  // MARK: API REST Metods

  func getMovies(parameters: [String: Any], success: @escaping ((Movies) -> Void), fail: @escaping (() -> Void)) {
    guard let urlApi = parameters["url"] else {
      return
    }
    var filter = ""
    if let exist = parameters["filter"] as? String {
      filter = exist
    }
    ServiceManager.shared.callService(urlString: "https://api.themoviedb.org/3/\(urlApi)?api_key=\(apiKey)\(filter)", parameters: parameters) { (response: Movies) in success(response)
    } fail: {
      
      // TODO: Build error method manager

      fail()
    }
  }
  
  func getMovieDetail(parameters: [String: Any], success: @escaping ((Detail) -> Void), fail: @escaping (() -> Void)) {
    let id = parameters["id"] ?? "1"
    
    ServiceManager.shared.callService(urlString: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKey)&language=en-US", parameters: parameters) { (response: Detail) in success(response)
    } fail: {
      
      // TODO: Build error method manager

      fail()
    }
  }
  
  func getTrailer(parameters: [String: Any], success: @escaping ((Trailer) -> Void), fail: @escaping (() -> Void)) {
    let id = parameters["id"] ?? "1"
    ServiceManager.shared.callService(urlString: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(apiKey)&language=en-US", parameters: parameters) { (response: Trailer) in success(response)
    } fail: {
      
      // TODO: Build error method manager

      fail()
    }
  }
  
  // MARK: Map structure app

  func getMapApi(success: @escaping (([MapApi]) -> Void), fail: @escaping (() -> Void)) {
    if let path = Bundle.main.path(forResource: "Map", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let decoded = try JSONDecoder().decode(MapApi.self, from: data)
        success([decoded])
      } catch {
      }
    } else {

    }
  }
  
}
