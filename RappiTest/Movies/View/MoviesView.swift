//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import Foundation
import UIKit

class MoviesView: UITableViewController {
  
  // MARK: Observer to open Movie Detail
  
  private let notificationCenter = NotificationCenter.default

  // MARK: Instantiate ViewModel

  var mapApiViewModel = MapApiViewModel()
  
  var filter = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Config tableview
    tableView = UITableView(frame: tableView.frame, style: .grouped)
    
    // Register Cell
    tableView.register(MoviesViewCell.self, forCellReuseIdentifier: "moviesViewCell")
    tableView.backgroundColor = UIColor.mainBlackColor
    tableView.register(MoviesHeaderSectionView.self, forHeaderFooterViewReuseIdentifier: MoviesHeaderSectionView.identifier)
    tableView.register(MoviesHeaderFiltersView.self, forHeaderFooterViewReuseIdentifier: MoviesHeaderFiltersView.identifier)
 
    // Observer to open Movie Detail
    notificationCenter.addObserver(self, selector: #selector(openDetail), name: NSNotification.Name("openDetail"), object: nil)
    
    configureView()
    bind()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    // TODO: create custom class

    let nav = self.navigationController?.navigationBar
    nav?.barStyle = UIBarStyle.black
    nav?.isTranslucent = false
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 33))
    imageView.contentMode = .scaleAspectFit
    let image = UIImage(named: "logoemovie")
    imageView.image = image
    navigationItem.titleView = imageView
  }
  
  // MARK: Get data movies

  private func configureView() {
    mapApiViewModel.dataMapApi()
  }
  
  func bind() {
    mapApiViewModel.refreshData = { [weak self] () in
      // DispatchQueue.main.async {
        // self?.tableView.reloadData()
      // }
    }
  }
  
  // MARK: UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "moviesViewCell", for: indexPath) as? MoviesViewCell {
      cell.selectionStyle = .none
      cell.setup(map: [mapApiViewModel.mapApi[0].map[indexPath.section]], filterIndex: filter)
      cell.backgroundColor = UIColor.mainBlackColor
      return cell
    }
    fatalError("Unable to dequeReusableCell")
  }
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return mapApiViewModel.mapApi[0].map.count
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
    if mapApiViewModel.mapApi[0].map[section].filter {
      return 99
    }
    return 30
  }
  
  // MARK: Custom Header With Filters

  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    if mapApiViewModel.mapApi[0].map[section].filter {
      if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MoviesHeaderFiltersView.identifier) as? MoviesHeaderFiltersView {
        header.setup(map: mapApiViewModel.mapApi[0].map[section], filterIndex: filter, section: section)
        
        // FIXME: Im not sure if works fine, this works only for class MoviesHeaderFiltersView, change for dynamic filters and cells

        notificationCenter.addObserver(self, selector: #selector(updateFilter), name: NSNotification.Name("updateFilter"), object: nil)
        
        return header
      }
    }
    if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MoviesHeaderSectionView.identifier) as? MoviesHeaderSectionView {
      header.setup(map: mapApiViewModel.mapApi[0].map[section])
      return header
    }
    return nil
  }
  
  // MARK: Update filter Recomendados para ti

  @objc private func updateFilter(_ notification: NSNotification) {
    if let dict = notification.userInfo as NSDictionary? {
      if let index = dict["index"] as? Int {
        guard let section = dict["section"] as? Int else { return }
        filter = index
        configureView()
        let indexpath = IndexPath(item: 0, section: section)
        self.tableView.reloadRows(at: [indexpath], with: .none)
        self.tableView.reloadSections(IndexSet(integer: section), with: .none)
      }
    }
  }
  
  // MARK: Open Movie Detail
  
  @objc private func openDetail(_ notification: NSNotification) {
    if let dict = notification.userInfo as NSDictionary? {
      if let id = dict["id"] as? Int {
        let mvc = DetailView()
        mvc.movieId = id
        self.present(mvc, animated: true, completion: nil)
       
        // TODO: if is necesary, change to push view controller to put the back arrow
        // Push view controller
        // navigationController?.pushViewController(mvc, animated: true)
      }
    }
  }
}
