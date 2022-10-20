//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import UIKit
import Nuke

protocol ReusableMovieView: AnyObject {
  static var identifier: String { get }
}

final class MoviesCollectionCell: UICollectionViewCell {
  
  // MARK: Define UI Elements

  private let posterImageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  // MARK: Init View

  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupViews()
    setupLayouts()
  }
  
  // MARK: Add views

  private func setupViews() {
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 20
    contentView.backgroundColor = UIColor.mainBlackColor
    contentView.addSubview(posterImageView)
  }
  
  // MARK: Update Constraint

  private func setupLayouts() {
    posterImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }

  // MARK: Setup Movie Poster

  func setup(with movie: ResultsMovies) {
    
    if let urlPreview = URL(string: "https://image.tmdb.org/t/p/w92/\(movie.posterPath)") {
      let request = ImageRequest(
          url: urlPreview,
          priority: .high
      )
      Nuke.loadImage(with: request, into: self.posterImageView) { _ in
        if let url = URL(string: "https://image.tmdb.org/t/p/w342/\(movie.posterPath)") {
          Nuke.loadImage(with: url, into: self.posterImageView)
        }
      }
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - ReusableIdString

extension MoviesCollectionCell: ReusableMovieView {
  static var identifier: String {
    return String(describing: self)
  }
}
