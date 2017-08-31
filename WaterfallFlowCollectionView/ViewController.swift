//
//  ViewController.swift
//  WaterfallFlowCollectionView
//
//  Created by wangwenbo on 2017/8/31.
//  Copyright © 2017年 Double. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let waterFallCollectionView = WBWaterFallCollectionView()
    waterFallCollectionView.modelArray = WBModel.getModels()
    view.addSubview(waterFallCollectionView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

