//
//  Map.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 16/10/22.
//

struct MapApi: Codable {
  let map: [Map]
}

struct Map: Codable {
  let title: String
  let urlApi: String
  let filter: Bool
  let filters: [Filters]?
}

struct Filters: Codable {
  let title: String
  let urlApi: String
  let filter: String
}
