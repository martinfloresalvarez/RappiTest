//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import Foundation

struct Detail: Codable {
  let statusMessage: String?
  let statusCode: Int?
  let adult: Bool
  let backdropPath: String?
  let belongsToCollection: ResultsBelong?
  let budget: Int?
  let genres: [ResultsGenres]
  let homepage: String
  let id: Int
  let imdbId: String?
  let originalLanguage: String?
  let originalTitle: String?
  let overview: String?
  let popularity: Double?
  let posterPath: String
  let productionCompanies: [ResultsProductionCompanies]?
  let productionCountries: [ResultsProductionCountries]?
  let releaseDate: String?
  let revenue: Int?
  let runtime: Int?
  let spokenLanguages: [ResultsSpokenLanguages]?
  let status: String?
  let tagline: String?
  let title: String?
  let name: String?
  let video: Bool?
  let voteAverage: Double
  let voteCount: Int
  
  enum CodingKeysDetail: String, CodingKey {
    case statusMessage = "status_message"
    case statusCode = "status_code"
    case resultsMovies = "results"
    case adult = "adult"
    case backdropPath = "backdrop_path"
    case belongsToCollection = "belongs_to_collection"
    case budget = "budget"
    case genres = "genres"
    case homepage = "homepage"
    case id = "id"
    case imdbId = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview = "overview"
    case popularity = "popularity"
    case posterPath = "poster_path"
    case productionCompanies = "production_companies"
    case productionCountries = "production_countries"
    case releaseDate = "release_date"
    case revenue = "revenue"
    case runtime = "runtime"
    case spokenLanguages = "spoken_languages"
    case status = "status"
    case tagline = "tagline"
    case title = "title"
    case name = "name"
    case video = "video"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
  
  init(from decoder: Decoder) throws {
    let container1 = try decoder.container(keyedBy: CodingKeysDetail.self)
    self.statusMessage = try container1.decodeIfPresent(String.self, forKey: CodingKeysDetail.statusMessage)
    self.statusCode = try container1.decodeIfPresent(Int.self, forKey: CodingKeysDetail.statusCode)
    self.adult = try container1.decode(Bool.self, forKey: CodingKeysDetail.adult)
    self.backdropPath = try container1.decode(String.self, forKey: CodingKeysDetail.backdropPath)
    self.belongsToCollection = try container1.decodeIfPresent(ResultsBelong.self, forKey: CodingKeysDetail.belongsToCollection)
    self.budget = try container1.decode(Int.self, forKey: CodingKeysDetail.budget)
    self.genres = try container1.decode([ResultsGenres].self, forKey: CodingKeysDetail.genres)
    self.homepage = try container1.decode(String.self, forKey: CodingKeysDetail.homepage)
    self.imdbId = try container1.decode(String.self, forKey: CodingKeysDetail.imdbId)
    self.originalLanguage = try container1.decode(String.self, forKey: CodingKeysDetail.originalLanguage)
    self.originalTitle = try container1.decode(String.self, forKey: CodingKeysDetail.originalTitle)
    self.overview = try container1.decode(String.self, forKey: CodingKeysDetail.overview)
    self.popularity = try container1.decode(Double.self, forKey: CodingKeysDetail.popularity)
    self.id = try container1.decode(Int.self, forKey: CodingKeysDetail.id)
    self.posterPath = try container1.decode(String.self, forKey: CodingKeysDetail.posterPath)
    self.productionCompanies = try container1.decode([ResultsProductionCompanies].self, forKey: CodingKeysDetail.productionCompanies)
    self.productionCountries = try container1.decode([ResultsProductionCountries].self, forKey: CodingKeysDetail.productionCountries)
    self.releaseDate = try container1.decode(String.self, forKey: CodingKeysDetail.releaseDate)
    self.revenue = try container1.decode(Int.self, forKey: CodingKeysDetail.revenue)
    self.runtime = try container1.decode(Int.self, forKey: CodingKeysDetail.runtime)
    self.spokenLanguages = try container1.decode([ResultsSpokenLanguages].self, forKey: CodingKeysDetail.spokenLanguages)
    self.status = try container1.decode(String.self, forKey: CodingKeysDetail.status)
    self.tagline = try container1.decode(String.self, forKey: CodingKeysDetail.tagline)
    self.title = try container1.decode(String.self, forKey: CodingKeysDetail.title)
    self.name = try container1.decodeIfPresent(String.self, forKey: CodingKeysDetail.name)
    self.video = try container1.decode(Bool.self, forKey: CodingKeysDetail.video)
    self.voteAverage = try container1.decode(Double.self, forKey: CodingKeysDetail.voteAverage)
    self.voteCount = try container1.decode(Int.self, forKey: CodingKeysDetail.voteCount)
    
  }
}

struct ResultsBelong: Codable {
  
  let id: Int
  let name: String
  let posterPath: String
  let backdropPath: String
  
  enum CodingKeysBelong: String, CodingKey {
    case id = "id"
    case name = "name"
    case posterPath = "poster_path"
    case backdropPath = "backdrop_path"
  }
  init(from decoder: Decoder) throws {
    let container1 = try decoder.container(keyedBy: CodingKeysBelong.self)
    self.id = try container1.decode(Int.self, forKey: CodingKeysBelong.id)
    self.name = try container1.decode(String.self, forKey: CodingKeysBelong.name)
    self.posterPath = try container1.decode(String.self, forKey: CodingKeysBelong.posterPath)
    self.backdropPath = try container1.decode(String.self, forKey: CodingKeysBelong.backdropPath)
  }
}

struct ResultsGenres: Codable {
  let id: Int
  let name: String
}

struct ResultsProductionCompanies: Codable {
  
  let id: Int
  let name: String
  let logoPath: String?
  let originCountry: String
  
  enum CodingKeysCompanies: String, CodingKey {
    case id = "id"
    case name = "name"
    case logoPath = "logo_path"
    case originCountry = "origin_country"
  }
  
  init(from decoder: Decoder) throws {
    let container1 = try decoder.container(keyedBy: CodingKeysCompanies.self)
    self.id = try container1.decode(Int.self, forKey: CodingKeysCompanies.id)
    self.name = try container1.decode(String.self, forKey: CodingKeysCompanies.name)
    self.logoPath = try container1.decodeIfPresent(String.self, forKey: CodingKeysCompanies.logoPath)
    self.originCountry = try container1.decode(String.self, forKey: CodingKeysCompanies.originCountry)
  }
}

// TODO: check if is necesari this data

struct ResultsProductionCountries: Codable {
  
}

struct ResultsSpokenLanguages: Codable {
  
}
