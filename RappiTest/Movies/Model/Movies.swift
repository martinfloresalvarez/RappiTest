//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import Foundation

struct Movies: Codable {
  let page: Int
  let results: [ResultsMovies]
  let statusMessage: String?
  let success: Bool?
  let statusCode: Int?
  
  enum CodingKeysMovies: String, CodingKey {
    case resultsMovies = "results"
    case statusMessage = "status_message"
    case statusCode = "status_code"
  }
}

struct ResultsMovies: Codable {
  let posterPath: String
  let adult: Bool?
  let overview: String
  let releaseDate: String?
  let genreIds: [ResultsMoviesGenre]
  let id: Int
  let originalTitle: String?
  let originalLanguage: String
  let title: String?
  let popularity: Double
  let voteCount: Int
  let video: Bool?
  let voteAverage: Double
  // TV properties
  let name: String?
  let firstAirDate: String?
  
  enum CodingKeys: String, CodingKey {
    case posterPath = "poster_path"
    case adult = "adult"
    case overview = "overview"
    case releaseDate = "release_date"
    case genreIds = "genre_ids"
    case id = "id"
    case originalTitle = "original_title"
    case originalLanguage = "original_language"
    case title = "title"
    case popularity = "popularity"
    case voteCount = "vote_count"
    case video = "video"
    case voteAverage = "vote_average"
    // TV properties
    case name = "name"
    case firstAirDate = "first_air_date"
  }
}

// TODO: check if is necesari this data

struct ResultsMoviesGenre: Codable {

}
