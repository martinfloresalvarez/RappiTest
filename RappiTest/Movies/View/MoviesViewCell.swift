//
//  File.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit
import Nuke

class MoviesViewCell: UITableViewCell {

  // MARK: Observer to open Movie Detail
  
  private let notificationCenter = NotificationCenter.default

  // MARK: Instantiate ViewModel

  var moviesViewModel = MoviesViewModel()
  
  // MARK: Define UI Elements

  var collectionView: UICollectionView!
  
  // MARK: Init View

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    bind()
    setupViews()
    setupLayouts()
  }
  
  func bind() {
    self.moviesViewModel.refreshData = { [weak self] () in
      DispatchQueue.main.async {
        self?.collectionView.reloadData()
      }
    }
  }
  
  // MARK: Add views
  
  func setupViews() {
    contentView.isUserInteractionEnabled = false
    let layout = UICollectionViewFlowLayout.moviesCollectionLayout()
    layout.scrollDirection = .horizontal
    self.collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
    self.collectionView.isScrollEnabled = true
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    self.collectionView.register(MoviesCollectionCell.self, forCellWithReuseIdentifier: MoviesCollectionCell.identifier)
    self.collectionView.backgroundColor = UIColor.mainBlackColor
    self.addSubview(self.collectionView)
  }
  
  // MARK: Update constraint

  func setupLayouts() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.clipsToBounds = true
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
      collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
      collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
      collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
      collectionView.heightAnchor.constraint(equalToConstant: 280)
    ])
  }
  
  // MARK: Setup MAP Struct from Map.json

  func setup(map: [Map], filterIndex: Int) {
    if map[0].filter == true {
      if let filter = map[0].filters?[filterIndex].filter {
        moviesViewModel.parameters = ["url": map[0].urlApi, "filter": filter]
      }
    } else {
      moviesViewModel.parameters = ["url": map[0].urlApi]
    }
    moviesViewModel.getDataModel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: UICollection Delegate Methods

extension MoviesViewCell: UICollectionViewDelegate {}
extension MoviesViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if moviesViewModel.dataModel.count >= 1 {
      return moviesViewModel.dataModel[0].results.count
    }
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionCell.identifier, for: indexPath) as? MoviesCollectionCell else {
      fatalError("Unable to dequeReusableCell")
    }
    let movie =  moviesViewModel.dataModel[0].results[indexPath.row]
    cell.setup(with: movie)
    cell.alpha = 0
    cell.contentView.alpha = 0
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    let delay = sqrt(Double(indexPath.row)) * 0.2
    UIView.animate(withDuration: 0.2, delay: delay, options: .curveEaseOut, animations: {
      cell.transform = .identity
      cell.alpha = 1
      cell.contentView.alpha = 1
    })
  }
  
  // MARK: UITableViewDelegate

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    notificationCenter.post(name: NSNotification.Name("openDetail"), object: nil, userInfo: ["id": moviesViewModel.dataModel[0].results[indexPath.row].id])
  }
}

// MARK: Layout UICollection
// TODO: create a function to adapter diferents screen size and numbers of cells in screen
// FIXME: Fix to be friendly with ipad and macs

extension UICollectionViewFlowLayout {
  class func moviesCollectionLayout() -> UICollectionViewFlowLayout {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let width = UIScreen.main.bounds.width
    layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    layout.itemSize = CGSize(width: (width/2)-30, height: 240)
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 10
    return layout
  }
}
