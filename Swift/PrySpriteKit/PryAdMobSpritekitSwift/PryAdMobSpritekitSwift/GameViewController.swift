//
//  GameViewController.swift
//  PryAdMobSpritekitSwift
//
//  Created by Henry AT on 4/30/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

import UIKit
import SpriteKit

import GoogleMobileAds


/*
// Todo Este Bloque Borramos
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
*/

class GameViewController: UIViewController {  //GADInterstitialDelegate
  
  
  var googleBannerView: GADBannerView!       // Creamos variable de Banner
//  var googleInterstitial: GADInterstitial!   // Creamos variable del Interstitial

    override func viewDidLoad() {
        super.viewDidLoad()
      
// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
      

      // MARK: - Codigo para Mostrar Banner
      googleBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
      
      googleBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
      googleBannerView.rootViewController = self
      
      // PRODUCCION = = = = = = = =
//      googleBannerView.loadRequest(GADRequest())
      // = = = = = = = = = = = = = =
      
      // DESARROLLO = = = = = = = =
      var request:GADRequest = GADRequest()
      request.testDevices = ["2077ef9a63d2b398840261c8221a0c9a"]
      googleBannerView.loadRequest(request)
      // = = = = = = = =

      
      // Posicion del Banner:
      googleBannerView.frame = CGRectMake(0, view.bounds.height - googleBannerView.frame.size.height, googleBannerView.frame.size.width, googleBannerView.frame.size.height)
      
      self.view.addSubview(googleBannerView!)


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/*
// Todo Este Bloque Borramos
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
*/
      
// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
      
/*
      // MARK: - Codigo para Mostrar Intertitial
      googleInterstitial = GADInterstitial()
      googleInterstitial.adUnitID  = "ca-app-pub-3940256099942544/2934735716"
      //googleInterstitial.delegate = self
      
      var request:GADRequest = GADRequest()
      request.testDevices = ["2077ef9a63d2b398840261c8221a0c9a"]
      
      googleInterstitial.loadRequest(request)
      
      // PRODUCCION = = = = = = = =
      //      googleBannerView.loadRequest(GADRequest())
      // = = = = = = = = = = = = = =
      
      // DESARROLLO = = = = = = = =



      
      if googleInterstitial.isReady {
        googleInterstitial.presentFromRootViewController(self)
//        request()

      }
*/
      
      
      
    }
  
  
  override func viewWillLayoutSubviews() {
    
    super.viewWillLayoutSubviews()
    
    if let skView = self.view as? SKView {
      if skView.scene == nil {

        let aspectRatio = skView.bounds.size.height / skView.bounds.size.width
        let scene = GameScene(size:CGSize(width: 320, height: 320 * aspectRatio))
        
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.showsPhysics = false
        skView.ignoresSiblingOrder = true
        
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
        
      }}}
  

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
}
