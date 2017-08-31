//
//  WBWaterFallCollectionViewFlowLayout.swift
//  WaterfallFlowCollectionView
//
//  Created by wangwenbo on 2017/4/31.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

class WBWaterFallCollectionViewFlowLayout: UICollectionViewFlowLayout {
  
  var dataModelList: [AnyObject] {
    get {
      guard let layoutCollectionView = collectionView else {
        return []
      }
      if layoutCollectionView is WBWaterFallCollectionView {
        return (layoutCollectionView as! WBWaterFallCollectionView).modelArray
      } else {
        return []
      }
    }
  }
  
  // 列高数组 记录每一列的总高度
  var columnHeight = [CGFloat]()
  var columnCount = 0 // 总列数
  
  private var layoutAttributesArray = [UICollectionViewLayoutAttributes]() // 所有item的属性
  
  override func prepare() {
    columnHeight.removeAll()
    layoutAttributesArray.removeAll()
    
    let contentWidth: CGFloat = (collectionView?.bounds.size.width)! - sectionInset.left - sectionInset.right
    let marginX = minimumInteritemSpacing
    let itemWidth = (contentWidth - marginX * CGFloat(columnCount - 1)) / CGFloat(columnCount)
    
    if dataModelList.count > 0 {
      computeAttributesWithItemWidth(itemWidth: CGFloat(itemWidth))
    }
  }
  
  /**
   *  根据itemWidth计算布局属性
   */
  func computeAttributesWithItemWidth(itemWidth: CGFloat) {
    columnHeight = [CGFloat](repeating: 0, count: columnCount)
    // 定义一个记录每一列的总item个数的数组
    var columnItemCount = [Int](repeating: 0, count: columnCount)
    var attributesArray = [UICollectionViewLayoutAttributes]()
    
    var index = 0
    for dataModel in dataModelList {
      let indexPath = IndexPath(item: index, section: 0)
      let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
      // 找出最短列号
      let minHeight: CGFloat = columnHeight.sorted().first!
      let column = columnHeight.index(of: minHeight)
      // 数据追加在最短列
      columnItemCount[column!] += 1
      let itemX = (itemWidth + minimumInteritemSpacing) * CGFloat(column!) + sectionInset.left
      let itemY = minHeight + sectionInset.top
      // 等比例缩放 计算item的高度
      let itemH = getItemHeight(with: dataModel, itemWidth: itemWidth)
      // 设置frame
      attributes.frame = CGRect(x: itemX, y: itemY, width: itemWidth, height: itemH)
      attributesArray.append(attributes)
      // 累加列高
      columnHeight[column!] += itemH + minimumLineSpacing
      index += 1
    }
    
    if dataModelList.count == 0 {
      let indexPath = IndexPath(item: 0, section: 0)
      let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
      
      let itemX = sectionInset.left
      let itemY = sectionInset.top
      // 等比例缩放 计算item的高度
      let itemH: CGFloat = 208
      // 设置frame
      attributes.frame = CGRect(x: itemX, y: itemY, width: itemWidth, height: itemH)
      attributesArray.append(attributes)
    }
    
    layoutAttributesArray = attributesArray
  }
  
  // 计算itemSize
  func getItemHeight(with model: AnyObject, itemWidth: CGFloat) -> CGFloat {
    var itemHeight: CGFloat = 0
    if model is WBModel {
      let dataModel = model as! WBModel
      itemHeight = dataModel.pictureHeight / dataModel.pictureWidth * itemWidth
      itemHeight += (10 + dataModel.title.heightForFont(biggestTitle, width: (itemWidth - 2 * 5))) + 10
    }
    return itemHeight
  }
  
  override var collectionViewContentSize: CGSize {
    var contentSizeHeight: CGFloat = 0
    // 找出最高列列号
    if columnHeight.count > 0 {
      let maxHeight = columnHeight.sorted().last!
      contentSizeHeight += maxHeight
    }
    return CGSize(width: ScreenWidth, height: contentSizeHeight + sectionInset.top + sectionInset.bottom)
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return layoutAttributesArray
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return layoutAttributesArray[indexPath.item]
  }
  
}

