//
//  GameScene.swift
//  PryAdMobInterstitialSpriteKitSwift
//
//  Created by Henry AT on 5/2/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  let myLabel:SKLabelNode = SKLabelNode(fontNamed:"Chalkduster")
  
  
  override func didMoveToView(view: SKView) {
    /* Setup your scene here */
    //        myLabel = SKLabelNode(fontNamed:"Chalkduster")
    myLabel.text = "Publicidad";
    myLabel.fontSize = 20;
    myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
    
    self.addChild(myLabel)
  }
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    /* Called when a touch begins */
    
    for touch in (touches as! Set<UITouch>) {
      let location = touch.locationInNode(self)
      if(CGRectContainsPoint(myLabel.frame,location)){
        println("Toco el Label...")
        
        NSNotificationCenter.defaultCenter().postNotificationName("verAnuncio", object: nil)
      }
      
    }
  }
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
}
