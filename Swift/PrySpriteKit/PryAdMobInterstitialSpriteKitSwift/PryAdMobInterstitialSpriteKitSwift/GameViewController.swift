//
//  GameViewController.swift
//  PryAdMobInterstitialSpriteKitSwift
//
//  Created by Henry AT on 5/2/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//


import UIKit
import SpriteKit

import GoogleMobileAds


extension SKNode {
  class func unarchiveFromFile(file : String) -> SKNode? {
    if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
      var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
      var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
      
      archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
      let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
      archiver.finishDecoding()
      return scene
    } else {
      return nil
    }
  }
}

class GameViewController: UIViewController {
  
  var interstitial: GADInterstitial!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Creamos la variable para intertitial:
    self.interstitial = self.crearYCargar()
    
    var variable = GADRequest.sdkVersion()
    println("Google Mobile Ads SDK version: \(variable)")
    // MARK: El Observador del NSNotificationCenter
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "metodoShowPublicidad:", name: "verAnuncio", object: nil)
    
    
    if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
      // Configure the view.
      let skView = self.view as! SKView
      skView.showsFPS = true
      skView.showsNodeCount = true
      
      /* Sprite Kit applies additional optimizations to improve rendering performance */
      skView.ignoresSiblingOrder = true
      
      /* Set the scale mode to scale to fit the window */
      scene.scaleMode = .AspectFill
      
      skView.presentScene(scene)
    }
  }
  
  
  
  
  override func shouldAutorotate() -> Bool {
    return true
  }
  
  override func supportedInterfaceOrientations() -> Int {
    if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
      return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
    } else {
      return Int(UIInterfaceOrientationMask.All.rawValue)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
  
  
  
  
  
  
  
  
  
  
  
  func metodoShowPublicidad(notification: NSNotification){
    
    if(notification.name == "verAnuncio"){
      println("Ahora tenemos que mostrar la Publicidad..")
      if(self.interstitial.isReady){
        self.interstitial.presentFromRootViewController(self)
        self.interstitial = crearYCargar()
      }
    }
  }
  
  
  // ====== Metodo para el Anuncio:
  func crearYCargar() -> GADInterstitial {
    
    var aa  = GADInterstitial()
    aa.adUnitID = "ca-app-pub-3940256099942544/1033173712"
    
    var request = GADRequest()
    request.testDevices = ["2077ef9a63d2b398840261c8221a0c9a"]
    
    aa.loadRequest(request)
    
    return aa
  }
  
  
  
  
  
  
  
}
