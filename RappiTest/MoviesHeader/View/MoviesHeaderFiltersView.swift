//
//  MoviesHeaderSectionView.swift
//  RappiTest
//
//  Created by Martin Flores Alvarez on 17/10/22.
//

import UIKit

class MoviesHeaderFiltersView: UITableViewHeaderFooterView {
  
  // MARK: Observer to update Movie Filter
  
  private let notificationCenter = NotificationCenter.default
  
  // MARK: Section to update

  var section: Int = 0
  
  // MARK: Define UI Elements

  let titleLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .categoriesMoviesFont
    label.textColor = UIColor.mainWhiteColor
    return label
  }()
  
  let filterScroll: UIScrollView = {
    let scroll = UIScrollView(frame: .zero)
    return scroll
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
    contentView.addSubview(filterScroll)
  }
  
  // MARK: Update Constraint

  private func setupLayouts() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    filterScroll.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11)
    ])
    NSLayoutConstraint.activate([
      filterScroll.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
      filterScroll.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
      filterScroll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 11),
      filterScroll.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
    ])
  }
  
  // MARK: Setup Headers Filters

  func setup(map: Map, filterIndex: Int, section: Int) {
    self.section = section
    titleLabel.text = map.title
    var xOffset: CGFloat = 10
    
    // TODO: Im thinking to change to uicollectionview

    if let filters = map.filters {
      var btnTag = 0
      for filter in filters {
        let button = UIButton()
        
        if filterIndex == btnTag {
          button.backgroundColor = UIColor.mainWhiteColor
          button.setTitleColor(UIColor.mainBlackColor, for: .normal)
        } else {
          button.backgroundColor = UIColor.mainBlackColor
          button.layer.borderColor = UIColor.mainWhiteColor.cgColor
          button.setTitleColor(UIColor.mainWhiteColor, for: .normal)
        }
        
        button.titleLabel?.font = UIFont.filterMoviesFont
        button.tag = btnTag
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.setTitle("\(filter.title)", for: .normal)
        button.addTarget(self, action: #selector(btnTouch), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: xOffset, y: CGFloat(10), width: button.intrinsicContentSize.width+22, height: 40)
        btnTag += 1
        xOffset += CGFloat(10) + button.frame.size.width
        filterScroll.addSubview(button)
      }
    }
  }
  
  // MARK: Update filter Recomendados para ti

  @objc private func btnTouch(sender: UIButton) {
    notificationCenter.post(name: NSNotification.Name("updateFilter"), object: nil, userInfo: ["index": sender.tag, "section": self.section])
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

// MARK: - ReusableIdString

extension MoviesHeaderFiltersView: ReusableMovieView {
  static var identifier: String {
    return String(describing: self)
  }
}
