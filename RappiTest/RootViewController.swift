//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import Foundation
import UIKit

class RootViewController: UINavigationController {
  
  override func viewDidLoad() {
    self.view.backgroundColor = UIColor.backgroundAppColor
    let moviesView = MoviesView()
    let navigationController = self
    navigationController.setViewControllers([moviesView], animated: false)
  }
}
