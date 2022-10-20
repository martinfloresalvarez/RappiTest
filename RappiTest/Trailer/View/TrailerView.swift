//
//  moviesDetailOverlayCell.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 18/10/22.
//

import Foundation
import UIKit
import YouTubePlayerKit

class TrailerView: UITableViewCell {
  
  // MARK: Instantiate ViewModel

  var trailerViewModel = TrailerViewModel()
  
  // MARK: Instantiate Youtbe Player

  let youTubePlayerViewController = YouTubePlayerViewController()

  // MARK: Define Margins Design

  let margin = 22.0
  
  // MARK: Define UI Elements

  let trailerPlayer: UIView = {
    let view = UIView(frame: .zero)
    return view
  }()
  
  // MARK: Init View

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
    contentView.backgroundColor = UIColor.mainBlackColor
  }
  
  // MARK: Add views

  private func setupViews() {
    contentView.addSubview(trailerPlayer)
  }
  
  // MARK: Update Constraint

  private func setupLayouts() {
    
    trailerPlayer.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      trailerPlayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      trailerPlayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
      trailerPlayer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
      trailerPlayer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin)
    ])
    
  }
  
  // MARK: Setup Movie Trailer

  func setup(with movieId: Int) {
    trailerViewModel.parameters = ["id": movieId]
    trailerViewModel.data()
    trailerPlayer.addSubview(youTubePlayerViewController.view)
    bind()
  }
  
  private func bind() {
    self.trailerViewModel.refreshData = { [weak self] () in
      self?.initVideo()
    }
  }
  
  // TODO: change to collectionview horizontal to see all trailers 

  private func initVideo() {
    guard let urlYoutube = trailerViewModel.dataModel[0].results?[0].key else {
      return
    }
    let youTubePlayer = YouTubePlayer(
      source: .video(id: urlYoutube),
      configuration: .init(
        autoPlay: true
      )
    )
    youTubePlayerViewController.player = youTubePlayer
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
