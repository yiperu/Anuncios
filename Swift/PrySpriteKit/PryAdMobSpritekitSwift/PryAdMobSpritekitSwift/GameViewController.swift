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

class GameViewController: UIViewController {
  
  
  var googleBannerView: GADBannerView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
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
}
