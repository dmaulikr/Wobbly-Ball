//
//  GameStartScene.swift

//  Wobbly
//
//  Created by Andrew Viteri on 1/19/15.
//  Copyright (c) 2015 ViteriGames. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation



let cloudSprite1a = SKSpriteNode(texture: cloudTexture1)
let cloudSprite2a = SKSpriteNode(texture: cloudTexture2)

var playButton = SKSpriteNode(imageNamed: "playButton")
let infoButton = SKSpriteNode(imageNamed: "info")


let clickerSound = NSBundle.mainBundle().URLForResource("Click", withExtension: "wav")

let bgMusic = NSBundle.mainBundle().URLForResource("wind", withExtension: "wav")
let bgMusicPlayer = AVAudioPlayer(contentsOfURL: bgMusic, error: nil)
let Clicker = AVAudioPlayer(contentsOfURL: clickerSound, error: nil)




class GameStartScene: SKScene {
    
   let gameTitle = SKLabelNode()
   let gameTitle2 = SKLabelNode()
    
  
    override func didMoveToView(view: SKView) {
    
      
        
        backgroundImage.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        backgroundImage.size = self.size
        self.addChild(backgroundImage)
        
       playButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)/1.1);
        playButton.size = CGSize(width: 125, height: 125)
        
        bgMusicPlayer.play()
        bgMusicPlayer.numberOfLoops = -1
        bgMusicPlayer.volume = 0.6
        
        self.addChild(playButton)
        
        infoButton.size = CGSize(width: 30, height: 30)
        infoButton.position = CGPoint(x:CGRectGetMidX(self.frame)*1.85, y:CGRectGetMidY(self.frame)*1.9);
        self.addChild(infoButton)
        
        
        gameTitle.fontName = "AvenirNext-BoldItalic"
        gameTitle.text = "Wobbly";
        gameTitle.fontSize = 80;
        gameTitle.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.6);
        gameTitle.alpha=0.5
        gameTitle.zPosition=9
        self.addChild(gameTitle)
        
        
        gameTitle2.fontName = "AvenirNext-BoldItalic"
        gameTitle2.text = "Ball";
        gameTitle2.fontSize = 80;
        gameTitle2.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.3);
        gameTitle2.alpha=0.5
        gameTitle2.zPosition=9
        self.addChild(gameTitle2)
        
            
        cloudSprite1a.position = CGPoint(x:CGRectGetMidX(self.frame)*1.6, y:CGRectGetMidY(self.frame)*1.8);
        cloudSprite1a.physicsBody = SKPhysicsBody(rectangleOfSize: cloudSprite1.size)
        cloudSprite1a.physicsBody?.affectedByGravity = false
        cloudSprite1a.physicsBody!.collisionBitMask = 0;
        cloudSprite1a.physicsBody?.friction = 0
        cloudSprite1a.physicsBody!.linearDamping = 0
        cloudSprite1a.physicsBody!.angularDamping = 0
        cloudSprite1a.physicsBody?.categoryBitMask = 0
        cloudSprite1a.size = CGSizeMake(100, 90)
        self.addChild(cloudSprite1a)
        
        
        
        cloudSprite2a.position = CGPoint(x:CGRectGetMidX(self.frame)*1.8, y:CGRectGetMidY(self.frame)*1.6);
        cloudSprite2a.physicsBody = SKPhysicsBody(rectangleOfSize: cloudSprite2.size)
        cloudSprite2a.physicsBody?.affectedByGravity = false
        cloudSprite2a.physicsBody!.collisionBitMask = 0;
        cloudSprite2a.physicsBody?.friction = 0
        cloudSprite2a.physicsBody!.linearDamping = 0
        cloudSprite2a.physicsBody!.angularDamping = 0
        cloudSprite2a.physicsBody?.categoryBitMask = 0
        cloudSprite2a.size = CGSizeMake(55, 50)
        self.addChild(cloudSprite2a)
        
        cloudSprite1a.physicsBody!.velocity = CGVectorMake(-8, 0)
        
        
        cloudSprite2a.physicsBody?.velocity = CGVectorMake(-6,0)
            
            
            
        cloudSprite1.position = CGPoint(x:CGRectGetMidX(self.frame)/1.6, y:CGRectGetMidY(self.frame)*1.9);
        cloudSprite1.physicsBody = SKPhysicsBody(rectangleOfSize: cloudSprite1.size)
        cloudSprite1.physicsBody?.affectedByGravity = false
        cloudSprite1.physicsBody!.collisionBitMask = 0;
        cloudSprite1.physicsBody?.friction = 0
        cloudSprite1.physicsBody!.linearDamping = 0
        cloudSprite1.physicsBody!.angularDamping = 0
        cloudSprite1.physicsBody?.categoryBitMask = 0
        cloudSprite1.size = CGSizeMake(100, 90)
        self.addChild(cloudSprite1)
        
        
        
        cloudSprite2.position = CGPoint(x:CGRectGetMidX(self.frame)/1.4, y:CGRectGetMidY(self.frame)*1.7);
        cloudSprite2.physicsBody = SKPhysicsBody(rectangleOfSize: cloudSprite2.size)
        cloudSprite2.physicsBody?.affectedByGravity = false
        cloudSprite2.physicsBody!.collisionBitMask = 0;
        cloudSprite2.physicsBody?.friction = 0
        cloudSprite2.physicsBody!.linearDamping = 0
        cloudSprite2.physicsBody!.angularDamping = 0
        cloudSprite2.physicsBody?.categoryBitMask = 0
        cloudSprite2.size = CGSizeMake(55, 50)
        self.addChild(cloudSprite2)
        
        cloudSprite1.physicsBody!.velocity = CGVectorMake(-8, 0)
        
        
        cloudSprite2.physicsBody?.velocity = CGVectorMake(-6,0)
        
        
  
    }

    
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let gameScene = GameScene(size: self.frame.size)
        let infoScene = ChooseBallScene(size: self.frame.size)
        var location = CGPoint(x: 0, y: 0)
        var touch : UITouch! = touches.anyObject() as UITouch
        location = touch.locationInNode(self)
        
        if playButton.containsPoint(location) {
        
            
            
            Clicker.play()
        
        
            
        self.removeChildrenInArray([cloudSprite1a,cloudSprite2a,gameTitle,playButton,cloudSprite1,cloudSprite2,infoButton,backgroundImage])
        self.view?.presentScene(gameScene)
        
       
        }
        
        if infoButton.containsPoint(location) {
            
            
            
            Clicker.play()
            
            
            
            self.removeChildrenInArray([cloudSprite1a,cloudSprite2a,gameTitle,playButton,cloudSprite1,cloudSprite2,infoButton,backgroundImage])
            self.view?.presentScene(infoScene)
            
            
        }

        
    }
    
    
        

  
    
    override func update(currentTime: CFTimeInterval) {
        if cloudSprite1a.position.x < -50{
            cloudSprite1a.position = CGPoint(x:CGRectGetMidX(self.frame)*2.4, y:CGRectGetMidY(self.frame)*1.8);
        }
        if cloudSprite2a.position.x < -40{
            cloudSprite2a.position = CGPoint(x:CGRectGetMidX(self.frame)*2.2, y:CGRectGetMidY(self.frame)*1.6);
        }
        if cloudSprite1.position.x < -50{
            cloudSprite1.position = CGPoint(x:CGRectGetMidX(self.frame)*2.4, y:CGRectGetMidY(self.frame)*1.9);
        }
        if cloudSprite2.position.x < -40{
            cloudSprite2.position = CGPoint(x:CGRectGetMidX(self.frame)*2.2, y:CGRectGetMidY(self.frame)*1.7);
        }
    }
}
        
        

    
    
    
    