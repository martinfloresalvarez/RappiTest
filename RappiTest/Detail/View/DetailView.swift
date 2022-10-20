//
//  MoviesDetailViewController.swift
//  NeflixTestApp
//
//  Created by Martin Flores Alvarez on 16/08/22.
//

import Foundation
import UIKit

class DetailView: UITableViewController {
  
  // MARK: Observer to open Movie Detail
  
  private let notificationCenter = NotificationCenter.default
  
  // MARK: ID Movie
  
  var movieId = Int()
  
  // MARK: Instantiate ViewModel

  var detailViewModel = DetailViewModel()
  
  var isShowTrailer = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Config tableview
    self.view.backgroundColor = UIColor.mainBlackColor
    
    // Register Cell
    tableView.register(DetailHeaderCell.self, forCellReuseIdentifier: "detailHeaderCell")
    tableView.register(DetailOverviewCell.self, forCellReuseIdentifier: "detailOverviewCell")
    tableView.register(TrailerView.self, forCellReuseIdentifier: "trailerView")
    
    // Observer to open show trailer
    notificationCenter.addObserver(self, selector: #selector(whatchTrailer), name: NSNotification.Name("whatchTrailer"), object: nil)
        
    configureView()
    bind()
  }
  
  // MARK: Get data movies

  private func configureView() {
    detailViewModel.parameters = ["id": movieId]
    detailViewModel.getDataModel()
  }
  
  private func bind() {
    detailViewModel.refreshData = { [weak self] () in
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }
  
  // MARK: UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if detailViewModel.dataModel.count >= 1 {
      return 3
    }
    return 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "detailHeaderCell", for: indexPath) as? DetailHeaderCell {
        cell.setup(with: detailViewModel.dataModel[0])
        return cell
      }
    }
    if indexPath.row == 1 {
      if isShowTrailer {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "trailerView", for: indexPath) as? TrailerView {
          cell.setup(with: movieId)
          return cell
        }
      }
      return UITableViewCell()
    }
    if indexPath.row == 2 {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "detailOverviewCell", for: indexPath) as? DetailOverviewCell {
        cell.setup(with: detailViewModel.dataModel[0].overview ?? "No description")
        return cell
      }
    }
    fatalError("Unable to dequeReusableCell")
  }
  
  // TODO: create a function to adapter diferents screen size and numbers of cells in screen
  // FIXME: Fix to be friendly with ipad and macs
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 500
    }
    if indexPath.row == 1 {
      if !isShowTrailer {
        return 0
      }
      return 300
    }
    return UITableView.automaticDimension
  }
  
  // TODO: create a function to adapter diferents screen size and numbers of cells in screen
  // FIXME: Fix to be friendly with ipad and macs
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return UIScreen.main.bounds.height*0.7
    }
    if indexPath.row == 1 {
      if !isShowTrailer {
        return 0
      }
      return 300
    }
    return UITableView.automaticDimension
  }
  
  // MARK: Update cell to show Trailer

  @objc private func whatchTrailer(_ notification: NSNotification) {
    isShowTrailer.toggle()
    tableView.beginUpdates()
    let indexpath = IndexPath(item: 1, section: 0)
    tableView.reloadRows(at: [indexpath], with: .fade)
    tableView.endUpdates()
  }
}
