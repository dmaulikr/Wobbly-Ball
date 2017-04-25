//
//  GameScene.swift
//  Balance It
//
//  Created by Andrew Viteri on 1/15/15.
//  Copyright (c) 2015 ViteriGames. All rights reserved.
//

import SpriteKit
import AVFoundation
import AudioToolbox

let tilter = SKSpriteNode(imageNamed:"tilter")
var ball = SKSpriteNode(imageNamed: "ball")
let hitter = SKSpriteNode(imageNamed: "hitter")
let upperBall = SKSpriteNode(imageNamed: "upperBall")
let ground = SKSpriteNode(imageNamed: "contacts")
let smallBallLose = SKSpriteNode(imageNamed: "contacts2")
let cloudTexture1 = SKTexture(imageNamed: "cloud1")
let cloudSprite1 = SKSpriteNode(texture: cloudTexture1)
let cloudTexture2 = SKTexture(imageNamed: "cloud2")
let cloudSprite2 = SKSpriteNode(texture: cloudTexture2)
let backgroundImage = SKSpriteNode(imageNamed: "background")

var startPointTilt : CGPoint!

let groundCategory: UInt32 = 2
let ballCategory: UInt32 = 1
let hitterCategory: UInt32 = 16
let upperBallCategory: UInt32 = 4
let smallBallLoseCategory: UInt32 = 32

var scoreLabel = SKLabelNode()
var score = 0




var userDefaults = NSUserDefaults.standardUserDefaults()




let hitSound = NSBundle.mainBundle().URLForResource("hit", withExtension: "wav")

let Player = AVAudioPlayer(contentsOfURL: hitSound, error: nil)




let lose = NSBundle.mainBundle().URLForResource("lose", withExtension: "wav")
let loseSound = AVAudioPlayer(contentsOfURL: lose, error: nil)

class GameScene: SKScene, SKPhysicsContactDelegate {
   
    
    

    
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      
        
  
        
        backgroundImage.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        backgroundImage.size = self.size
        self.addChild(backgroundImage)
        
       
        
        //score
        
        
        scoreLabel.fontName = "Verdana"
        scoreLabel.text = "0";
        scoreLabel.fontSize = 230;
        scoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.28);
        scoreLabel.alpha=0.4
        scoreLabel.zPosition=9
        self.addChild(scoreLabel)
        
        
        self.physicsWorld.contactDelegate = self
       
       
        //Create a physics body that borders the screen
        let borderBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        //Set the friction of that physicsBody to 0
        borderBody.friction = 0
        //Set physicsBody of scene to borderBody
        self.physicsBody = borderBody
        
        
        //ball that moves on tilter sprite here
        
        ball.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)/1.2);
        ball.size = CGSize(width: 35, height: 35)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.dynamic = true
        ball.physicsBody?.restitution = 0.5
        ball.zRotation = 0
        self.addChild(ball);
        
        //small ball lose contact sprite here
        smallBallLose.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.1);
        smallBallLose.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1000,1))
        smallBallLose.physicsBody?.dynamic = false
        self.addChild(smallBallLose)
        
       
    
        //bottom sprite here
        ground.position = CGPoint(x:CGRectGetMidX(self.frame), y:0);
        ground.size = CGSize(width: 1000, height: 5)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1000,5))
        ground.physicsBody?.dynamic = false
        
        self.addChild(ground)
        
        //titler sprite here
        
        tilter.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)/1.5);
        tilter.size = CGSize(width: 245, height: 5)
        tilter.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(250,5))
        tilter.physicsBody?.dynamic = false
        tilter.zRotation = 0
        self.addChild(tilter)
        
        
       
        
        
        
        
        
        
       
        
        //recctangle that hits moving ball here
        
        hitter.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.2);
        hitter.size = CGSize(width: 55, height: 10)
        hitter.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(55,10))
        hitter.physicsBody?.dynamic = false
        hitter.physicsBody?.restitution = 0
     
        self.addChild(hitter)
        
        //ball that bounces sprite here
        
        upperBall.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.5);
        upperBall.size = CGSize(width: 20, height: 20)
        upperBall.physicsBody?.dynamic = true
        upperBall.physicsBody = SKPhysicsBody(circleOfRadius: upperBall.size.width/2)
        upperBall.physicsBody?.restitution = 1
        upperBall.physicsBody?.friction = 0
        upperBall.physicsBody!.linearDamping = 0
        upperBall.physicsBody!.angularDamping = 0
        self.addChild(upperBall)
        upperBall.physicsBody?.affectedByGravity = false
        //makes upperBall start
        upperBall.physicsBody!.applyImpulse(CGVectorMake(3, 3.2))
        
        if upperBall.position.y == hitter.position.y + 2 {
        upperBall.physicsBody!.applyImpulse(CGVectorMake(3, 3.2))
        }
        
       
        
            
            
        ground.physicsBody?.categoryBitMask = groundCategory
        ball.physicsBody?.categoryBitMask = ballCategory
        hitter.physicsBody?.categoryBitMask = hitterCategory
        upperBall.physicsBody?.categoryBitMask = upperBallCategory
        smallBallLose.physicsBody?.categoryBitMask = smallBallLoseCategory
        
        ball.physicsBody?.contactTestBitMask = groundCategory
        ball.physicsBody?.collisionBitMask = groundCategory
        
        upperBall.physicsBody?.contactTestBitMask = hitterCategory | smallBallLoseCategory
        upperBall.physicsBody?.collisionBitMask = hitterCategory | smallBallLoseCategory
        
        
        userDefaults.setValue(score, forKey: "score")
    
        //move clouds
       
       
        cloudSprite1.position = CGPoint(x:CGRectGetMidX(self.frame)*1.6, y:CGRectGetMidY(self.frame)*1.8);
        cloudSprite1.physicsBody = SKPhysicsBody(rectangleOfSize: cloudSprite1.size)
        cloudSprite1.physicsBody?.affectedByGravity = false
        cloudSprite1.physicsBody!.collisionBitMask = 0;
        cloudSprite1.physicsBody?.friction = 0
        cloudSprite1.physicsBody!.linearDamping = 0
        cloudSprite1.physicsBody!.angularDamping = 0
        cloudSprite1.physicsBody?.categoryBitMask = 0
        cloudSprite1.size = CGSizeMake(100, 90)
        self.addChild(cloudSprite1)
    
        
        
        cloudSprite2.position = CGPoint(x:CGRectGetMidX(self.frame)*1.8, y:CGRectGetMidY(self.frame)*1.6);
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
    
    
    //contact
    func didBeginContact(contact: SKPhysicsContact) {
       
        
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask
        {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        
        if firstBody.categoryBitMask == 1 && secondBody.categoryBitMask == 2 {

           self.removeChildrenInArray([ball,upperBall,ground,tilter,hitter,cloudSprite1,cloudSprite2,hitter,scoreLabel,smallBallLose,backgroundImage])
            loseSound.play()
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            let gameOverScene = GameOverScene(size: self.frame.size)
            self.view?.presentScene(gameOverScene)
            
          
        }
        if firstBody.categoryBitMask == 4 && secondBody.categoryBitMask == 16 {
            
            score++
            scoreLabel.text = "\(score)"
            upperBall.physicsBody!.applyImpulse(CGVectorMake(CGFloat(arc4random_uniform(2)),CGFloat(arc4random_uniform(2))))
            Player.play()
            
            }
        
        if firstBody.categoryBitMask == 4 && secondBody.categoryBitMask == 32 {
            
         
            self.removeChildrenInArray([ball,upperBall,ground,tilter,hitter,cloudSprite1,cloudSprite2,hitter,scoreLabel,smallBallLose,backgroundImage])
            upperBall.physicsBody?.affectedByGravity = true
            loseSound.play()
             AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
           let gameOverScene = GameOverScene(size: self.frame.size)
            self.view?.presentScene(gameOverScene)
            
          
        }
        
    }
    
    
   
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    
    
  
    
        startPointTilt = (touches.anyObject() as UITouch).locationInView(self.view)
        
    }
    
        override func touchesMoved(touches: NSSet, withEvent event: UIEvent){
        /* Called when a touch begins */
        
            //moves hitter to position of finger
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            
            hitter.position.x = location.x
            }
        
            //tilts tilter with finger drag
    
            let currentPoint = (touches.anyObject() as UITouch).locationInView(self.view)
            
            let distance = currentPoint.x - startPointTilt.x
            
            startPointTilt = currentPoint
            
            tilter.zRotation = tilter.zRotation + distance/300.0
    
            
    
    }
        
   
    
    
  
    
    
   
    override func update(currentTime: CFTimeInterval) {
        if cloudSprite1.position.x < -50{
             cloudSprite1.position = CGPoint(x:CGRectGetMidX(self.frame)*2.4, y:CGRectGetMidY(self.frame)*1.8);
        }
        if cloudSprite2.position.x < -40{
            cloudSprite2.position = CGPoint(x:CGRectGetMidX(self.frame)*2.2, y:CGRectGetMidY(self.frame)*1.6);
    }
    
    
    
    }










}