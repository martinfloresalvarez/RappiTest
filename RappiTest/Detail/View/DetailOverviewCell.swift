//
//  moviesDetailOverlayCell.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 18/10/22.
//

import Foundation
import UIKit

class DetailOverviewCell: UITableViewCell {
  
  // MARK: Define Margins Design
  // TODO: Create constant to adjust all design margin

  let margin = 22.0
  
  // MARK: Define UI Elements

  let overviewLabel: UILabel = {
    let overviewLabel = UILabel(frame: .zero)
    overviewLabel.textAlignment = .left
    overviewLabel.numberOfLines = 0
    overviewLabel.textColor = UIColor.mainWhiteColor
    overviewLabel.font = UIFont.movieDetailFont
    return overviewLabel
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
    contentView.addSubview(overviewLabel)
  }
  
  // MARK: Update Constraint

  private func setupLayouts() {
    overviewLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
      overviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
      overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin)
    ])
  }
  
  // MARK: Setup Movie Detail row 1
  
  func setup(with overview: String) {
    overviewLabel.text = overview
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
