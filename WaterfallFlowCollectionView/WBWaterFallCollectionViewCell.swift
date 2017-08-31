//
//  WBWaterFallCollectionViewCell.swift
//  WaterfallFlowCollectionView
//
//  Created by wangwenbo on 2017/4/31.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

let biggestTitle = UIFont.boldSystemFont(ofSize: 16)

class WBWaterFallCollectionViewCell: UICollectionViewCell {
  
  var model = WBModel() {
    didSet {
      imageView.image = UIImage(named: model.pictureUrl)
      titleLabel.text = model.title
      imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: model.pictureHeight / model.pictureWidth * frame.size.width)
      titleLabel.frame = CGRect(x: 5, y: (imageView.frame.origin.y + imageView.frame.size.height) + 10, width: frame.size.width - 2 * 5, height: model.title.heightForFont(biggestTitle, width: frame.size.width - 2 * 5))
    }
  }
  
  let imageView = UIImageView()
  let titleLabel = UILabel()
  let subtitleLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width)
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 5
    imageView.layer.masksToBounds = true
    addSubview(imageView)
    
    titleLabel.frame = CGRect(x: 5, y: (imageView.frame.origin.y + imageView.frame.size.height) + 10, width: frame.size.width - 2 * 5, height: biggestTitle.lineHeight)
    titleLabel.font = biggestTitle
    titleLabel.textColor = UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)
    titleLabel.textAlignment = .left
    titleLabel.numberOfLines = 0
    addSubview(titleLabel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
