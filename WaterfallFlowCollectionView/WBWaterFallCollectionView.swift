//
//  WBWaterFallCollectionView.swift
//  WaterfallFlowCollectionView
//
//  Created by wangwenbo on 2017/4/31.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

class WBWaterFallCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
  
  let collectionLayout = WBWaterFallCollectionViewFlowLayout()
  
  var modelArray: [WBModel] = [] {
    didSet {
      reloadData()
    }
  }
  
  let SmallMarginSize: CGFloat = 10
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {

    collectionLayout.columnCount = 2
    collectionLayout.minimumLineSpacing = SmallMarginSize
    collectionLayout.minimumInteritemSpacing = SmallMarginSize
    collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: SmallMarginSize, bottom: SmallMarginSize, right: SmallMarginSize)
    
    super.init(frame: FullScreen, collectionViewLayout: collectionLayout)
    
    contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    backgroundColor = UIColor(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1)
    delegate = self
    dataSource = self
    showsVerticalScrollIndicator = false
    alwaysBounceVertical = true
    register(WBWaterFallCollectionViewCell.self, forCellWithReuseIdentifier: "WBWaterFallCollectionViewCell")
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return modelArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WBWaterFallCollectionViewCell", for: indexPath) as! WBWaterFallCollectionViewCell
    cell.model = modelArray[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
