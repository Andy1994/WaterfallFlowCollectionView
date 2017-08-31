//
//  WBModel.swift
//  WaterfallFlowCollectionView
//
//  Created by wangwenbo on 2017/8/31.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let FullScreen = UIScreen.main.bounds

class WBModel: NSObject {
  
  var title = ""
  var pictureUrl = ""
  var pictureWidth: CGFloat = 0
  var pictureHeight: CGFloat = 0
  
  class func getModels() -> [WBModel] {
    let images = ["1": CGSize(width: 789, height: 1024), "2": CGSize(width: 1201, height: 750), "3": CGSize(width: 600, height: 834), "4": CGSize(width: 1280, height: 800), "5": CGSize(width: 1280, height: 878)]
    let title = ["×", "×××××××", "××××××××××", "×××××××××××××××", "××××××××××××××××××××××", "×××××××××××××××××××××××", "×××××××××××××××××××××××××××××××××××", "×××××××××××××××××××××××××××××××××××××××××××", "×××××××××××××××××××××××××", "××××××××××××××××××××××××××××××××××××××××××××××××××"]
    
    var models = [WBModel]()
    for _ in 0 ... arc4random() % 1000 {
      let model = WBModel()
      model.title = title[Int(arc4random() % 10)]
      model.pictureUrl = "\((arc4random() % 5) + 1)"
      model.pictureWidth = (images[model.pictureUrl] ?? CGSize.zero).width
      model.pictureHeight = (images[model.pictureUrl] ?? CGSize.zero).height
      models.append(model)
    }
    return models
  }
  
}

extension String {
  
  func sizeForFont(_ font: UIFont, size: CGSize) -> CGSize {
    let fString = self as NSString
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
    let attrDict = [
      NSFontAttributeName: font,
      NSParagraphStyleAttributeName: paragraphStyle
    ]
    let rect = fString.boundingRect(with: size,
                                    options: [.truncatesLastVisibleLine, .usesLineFragmentOrigin],
                                    attributes: attrDict,
                                    context: nil)
    return rect.size
  }
  
  func heightForFont(_ font: UIFont, width: CGFloat) -> CGFloat {
    let size = self.sizeForFont(font, size: CGSize(width: width, height: CGFloat(MAXFLOAT)))
    return size.height
  }
  
}
