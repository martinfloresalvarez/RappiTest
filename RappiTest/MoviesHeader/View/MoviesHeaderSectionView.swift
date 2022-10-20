//
//  MoviesHeaderSectionView.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 17/10/22.
//

import UIKit

class MoviesHeaderSectionView: UITableViewHeaderFooterView {
    
  // MARK: Define UI Elements

  let titleLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .categoriesMoviesFont
    label.textColor = UIColor.mainWhiteColor
    return label
  }()
  
  // MARK: Init View

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  // MARK: Add views

  private func setupViews() {
    contentView.addSubview(titleLabel)
  }
  
  // MARK: Update Constraint

  private func setupLayouts() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
    ])
  }
  
  // MARK: Setup Headers Section

  func setup(map: Map) {
    titleLabel.text = map.title
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

// MARK: - ReusableIdString

extension MoviesHeaderSectionView: ReusableMovieView {
  static var identifier: String {
    return String(describing: self)
  }
}
