//
//  ViewController.swift
//  PryAdMobInterstitialVCSwift
//
//  Created by Henry AT on 5/2/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

import UIKit

import GoogleMobileAds


class ViewController: UIViewController {

  
  var interstitial: GADInterstitial!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Creamos la variable:
    self.interstitial = self.crearYCargar()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: La funcion
  func crearYCargar() -> GADInterstitial {
  
    var ad = GADInterstitial()
    ad.adUnitID = "ca-app-pub-3940256099942544/1033173712"
    
    var request = GADRequest()
    
    request.testDevices = ["2077ef9a63d2b398840261c8221a0c9a"]
    ad.loadRequest(request)
    return ad
  }
  
  
  @IBAction func adBoton(sender: AnyObject) {
    
    if(self.interstitial.isReady){
      self.interstitial.presentFromRootViewController(self)
      self.interstitial = crearYCargar()
    }
    
  }

}

