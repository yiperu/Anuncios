//
//  ViewController.swift
//  PryiAdBannerSimpleVCSwift
//
//  Created by Henry AT on 5/5/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

import UIKit

import iAd  // Delcaras el Framework

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // ==== Esta es la Unica Linea qie se necesita programar :P
    self.canDisplayBannerAds = true

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

