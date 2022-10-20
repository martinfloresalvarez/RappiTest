//
//  MovieTrailer.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 18/10/22.
//

import Foundation

struct Trailer: Codable {
  let id: Int?
  let results: [Trailers]?
  let statusMessage: String?
  let success: Bool?
  let statusCode: Int?
  
  enum CodingKeysTrailer: String, CodingKey {
    case id = "id"
    case results = "results"
    case statusMessage = "status_message"
    case success = "success"
    case statusCode = "status_code"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeysTrailer.self)
    self.id = try container.decodeIfPresent(Int.self, forKey: CodingKeysTrailer.id)
    self.results = try container.decodeIfPresent([Trailers].self, forKey: CodingKeysTrailer.results)
    self.statusMessage = try container.decodeIfPresent(String.self, forKey: CodingKeysTrailer.statusMessage)
    self.success = try container.decodeIfPresent(Bool.self, forKey: CodingKeysTrailer.success)
    self.statusCode = try container.decodeIfPresent(Int.self, forKey: CodingKeysTrailer.statusCode)
  }
}

struct Trailers: Codable {
  
  let iso6391: String
  let iso31661: String
  let name: String
  let key: String
  let size: Int
  let type: String
  let official: Bool
  let publishedAt: String
  let id: String
  
  enum CodingKeysTrailers: String, CodingKey {
    case iso6391 = "iso_639_1"
    case iso31661 = "iso_3166_1"
    case name = "name"
    case key = "key"
    case size = "size"
    case type = "type"
    case official = "official"
    case publishedAt = "published_at"
    case id = "id"
    
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeysTrailers.self)
    self.iso6391 = try container.decode(String.self, forKey: CodingKeysTrailers.iso6391)
    self.iso31661 = try container.decode(String.self, forKey: CodingKeysTrailers.iso31661)
    self.name = try container.decode(String.self, forKey: CodingKeysTrailers.name)
    self.key = try container.decode(String.self, forKey: CodingKeysTrailers.key)
    self.size = try container.decode(Int.self, forKey: CodingKeysTrailers.size)
    self.type = try container.decode(String.self, forKey: CodingKeysTrailers.type)
    self.official = try container.decode(Bool.self, forKey: CodingKeysTrailers.official)
    self.publishedAt = try container.decode(String.self, forKey: CodingKeysTrailers.publishedAt)
    self.id = try container.decode(String.self, forKey: CodingKeysTrailers.id)
  }
}
