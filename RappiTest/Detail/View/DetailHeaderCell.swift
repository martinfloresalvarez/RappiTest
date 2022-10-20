//
//  ViewController.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 15/10/22.
//

import UIKit
import Nuke

class DetailHeaderCell: UITableViewCell {
  
  // MARK: Observer to show Trailer

  private let notificationCenter = NotificationCenter.default
    
  // MARK: Define Margins Design
  // TODO: Create constant to adjust all design margin
  
  let margin = 22.0
  let heightShadow = UIScreen.main.bounds.height*0.7

  // MARK: Define UI Elements

  let posterImageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 5
    imageView.clipsToBounds = true
    return imageView
  }()
  
  let shadowLayer: UIView = {
    let view = UIImageView(frame: .zero)
    view.layer.masksToBounds = true
    view.clipsToBounds = true
    return view
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.textColor = UIColor.mainWhiteColor
    label.font = UIFont.movieDetailTitle
    return label
  }()
  
  let releaseDateLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.textAlignment = .center
    label.font = UIFont.movieDetailFont
    label.backgroundColor = UIColor.mainWhiteColor
    label.textColor = UIColor.mainBlackColor
    label.layer.cornerRadius = 3
    label.clipsToBounds = true
    return label
  }()
  
  let languageLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.textAlignment = .center
    label.textColor = UIColor.mainWhiteColor
    label.font = UIFont.movieDetailFont
    label.backgroundColor = UIColor.mainWhiteColor
    label.textColor = UIColor.mainBlackColor
    label.layer.cornerRadius = 3
    label.clipsToBounds = true
    return label
  }()
  
  let voteAverageLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.textAlignment = .center
    label.textColor = UIColor.mainBlackColor
    label.font = UIFont.movieDetailFont
    label.backgroundColor = UIColor.primaryYellowColor
    label.textColor = UIColor.mainBlackColor
    label.layer.cornerRadius = 3
    label.clipsToBounds = true
    return label
  }()
  
  let trailerButton: UIButton = {
    let button = UIButton(frame: .zero)
    button.backgroundColor = UIColor.clear
    button.setTitleColor(UIColor.mainWhiteColor, for: .normal)
    button.layer.borderColor = UIColor.mainWhiteColor.cgColor
    button.titleLabel?.font = UIFont.filterMoviesFont
    button.layer.cornerRadius = 10
    button.layer.borderWidth = 1
    button.addTarget(self, action: #selector(whatchTrailer), for: UIControl.Event.touchUpInside)
    button.setTitle("Ver trailers", for: .normal)
    return button
  }()
  
  let categoriesLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.textAlignment = .center
    label.textColor = UIColor.mainWhiteColor
    label.font = UIFont.movieDetailFont
    return label
  }()
  
  // MARK: Init View

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    shadowLayer.layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: heightShadow)
    setupViews()
    setupLayouts()
    contentView.backgroundColor = UIColor.mainBlackColor
  }
  
  // MARK: Add views
  
  private func setupViews() {
    contentView.addSubview(posterImageView)
    contentView.addSubview(shadowLayer)
    contentView.addSubview(trailerButton)
    contentView.addSubview(categoriesLabel)
    contentView.addSubview(releaseDateLabel)
    contentView.addSubview(languageLabel)
    contentView.addSubview(voteAverageLabel)
    contentView.addSubview(titleLabel)
  }
  
  // MARK: Update Constraint

  private func setupLayouts(){
    
    posterImageView.translatesAutoresizingMaskIntoConstraints = false
    shadowLayer.translatesAutoresizingMaskIntoConstraints = false
    trailerButton.translatesAutoresizingMaskIntoConstraints = false
    categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
    releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
    languageLabel.translatesAutoresizingMaskIntoConstraints = false
    voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
      posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
      posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
      posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
      posterImageView.heightAnchor.constraint(equalToConstant: 500)
    ])
    NSLayoutConstraint.activate([
      shadowLayer.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: 0),
      shadowLayer.topAnchor.constraint(equalTo: posterImageView.topAnchor, constant: 0),
      shadowLayer.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 0),
      shadowLayer.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 0)
    ])
    NSLayoutConstraint.activate([
      trailerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      trailerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
      trailerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
      trailerButton.heightAnchor.constraint(equalToConstant: 44)
    ])
    NSLayoutConstraint.activate([
      categoriesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      categoriesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
      categoriesLabel.bottomAnchor.constraint(equalTo: trailerButton.topAnchor, constant: -11)
    ])
    
    NSLayoutConstraint.activate([
      languageLabel.bottomAnchor.constraint(equalTo: categoriesLabel.topAnchor, constant: -11),
      languageLabel.centerXAnchor.constraint(equalTo: categoriesLabel.centerXAnchor, constant: 0),
      languageLabel.widthAnchor.constraint(equalToConstant: 35),
      languageLabel.heightAnchor.constraint(equalToConstant: 30)
    ])
    NSLayoutConstraint.activate([
      releaseDateLabel.trailingAnchor.constraint(equalTo: languageLabel.leadingAnchor, constant: -11),
      releaseDateLabel.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor, constant: 0),
      releaseDateLabel.widthAnchor.constraint(equalToConstant: 50),
      releaseDateLabel.heightAnchor.constraint(equalToConstant: 30)
    ])
    NSLayoutConstraint.activate([
      voteAverageLabel.leadingAnchor.constraint(equalTo: languageLabel.trailingAnchor, constant: 11),
      voteAverageLabel.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor, constant: 0),
      voteAverageLabel.widthAnchor.constraint(equalToConstant: 80),
      voteAverageLabel.heightAnchor.constraint(equalToConstant: 30)
    ])
    
    NSLayoutConstraint.activate([
      titleLabel.bottomAnchor.constraint(equalTo: languageLabel.topAnchor, constant: -11),
      titleLabel.centerXAnchor.constraint(equalTo: languageLabel.centerXAnchor, constant: 0),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin)
    ])
  }
  
  // MARK: Setup Movie Detail row 0

  func setup(with movie: Detail) {
       
    let options = ImageLoadingOptions(
        transition: .fadeIn(duration: 0.33)
    )
    
    if let urlPreview = URL(string: "https://image.tmdb.org/t/p/w220_and_h330_face\(movie.posterPath)") {
      Nuke.loadImage(with: urlPreview, options: options, into: self.posterImageView) { _ in
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)") {
          Nuke.loadImage(with: url, options: options, into: self.posterImageView)
        }
      }
    }

    titleLabel.text = movie.title
    if let fullDate = movie.releaseDate {
      let date =  fullDate.components(separatedBy: "-")
      releaseDateLabel.text = date[0]
    }
    voteAverageLabel.text = "★ \(movie.voteAverage)"
    languageLabel.text = movie.originalLanguage
    var categoriesString = ""
    for genre in  movie.genres {
      categoriesString = "\(categoriesString) \(genre.name)"
    }
    categoriesLabel.text = categoriesString
    shadowLayer.addShadow(to: [.bottom], radius: heightShadow, opacity: 1)
  }
  
  // MARK: Observer to show trailer

  @objc private func whatchTrailer() {
    notificationCenter.post(name: NSNotification.Name("whatchTrailer"), object: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
