//
//  GameViewController.swift
//  PryiAdBannerSpritekitSwift
//
//  Created by Henry AT on 5/4/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

import UIKit
import SpriteKit

// Importar el Framework:
import iAd


/*
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

class GameViewController: UIViewController, ADBannerViewDelegate {

  
  //      var googleBannerView: GADBannerView!       // Creamos variable de Banner
  let adBannerView = ADBannerView(frame: CGRect.zeroRect)
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
//      super.view.addSubview(adBannerView) // This is where I needed to add the banner.
      setupAds()
// = = = == = =  =
      
      /*
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
  
  // MARK: - Metodos Creado setupAds :
  func setupAds() {
//    adBannerView.center = CGPoint(x: adBannerView.center.x, y: view.bounds.size.height - adBannerView.frame.size.height / 2)
//    adBannerView.delegate = self
//    adBannerView.hidden = true
//    view.addSubview(adBannerView)
    adBannerView.center = CGPoint(x: adBannerView.center.x, y: view.bounds.size.height - adBannerView.frame.size.height / 2)
    adBannerView.center = CGPoint(x: view.bounds.size.width / 2, y: view.bounds.size.height - adBannerView.frame.size.height / 2)
    adBannerView.delegate = self
    adBannerView.hidden = true
    view.addSubview(adBannerView)
    
    
  }
  // MARK: - Metodos delegados:
  /* My funcs to handle the splash screen and game */
  
  // iAd delegates
  
  func bannerViewWillLoadAd(banner: ADBannerView!) {
    println("bannerViewWillLoadAd")
  }
  func bannerViewDidLoadAd(banner: ADBannerView!) {
//    self.adBannerView.alpha = 1.0
    banner.hidden = false
    println("bannerViewDidLoadAd")
  }
  func bannerViewActionDidFinish(banner: ADBannerView!) {
    println("bannerViewActionDidFinish")
  }
  func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
    println("bannerViewActionShouldBegin")
    return true
  }
  func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    println("bannerViewError")
    println(error)
    
  }
  
  
  
  
  
  
  
  
}
