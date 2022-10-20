//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import Foundation
import UIKit

extension UIFont {
  
  // MARK: Movies Font

  static var categoriesMoviesFont: UIFont {
    UIFont.systemFont(ofSize: 24, weight: .semibold)
  }
  static var filterMoviesFont: UIFont {
    UIFont.systemFont(ofSize: 14, weight: .regular)
  }
  
  // MARK: - Movies Detailb Font

  static var movieDetailFont: UIFont {
    UIFont.systemFont(ofSize: 16, weight: .regular)
  }
  static var movieDetailTitle: UIFont {
    UIFont.systemFont(ofSize: 26, weight: .black)
  }
}
