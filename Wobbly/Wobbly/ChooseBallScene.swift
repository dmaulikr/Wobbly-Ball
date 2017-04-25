//
//  ChooseBallScene.swift
//  Wobbly
//
//  Created by Andrew Viteri on 1/28/15.
//  Copyright (c) 2015 ViteriGames. All rights reserved.
//

import SpriteKit
import AVFoundation
import AudioToolbox

let chooseBall = SKLabelNode()

let tap = SKLabelNode()

let facea = SKSpriteNode(imageNamed: "face2")
let origBall = SKSpriteNode(imageNamed: "ball")
let whiteBelt = SKSpriteNode(imageNamed: "white")
let howtoUnlock = SKLabelNode()

let yell = SKSpriteNode(imageNamed: "yell")
let or = SKSpriteNode(imageNamed: "or")
let green = SKSpriteNode(imageNamed: "green")
let blue = SKSpriteNode(imageNamed: "blue")
let purp = SKSpriteNode(imageNamed: "purp")
let bro = SKSpriteNode(imageNamed: "brown")
let red = SKSpriteNode(imageNamed: "red")
let black = SKSpriteNode(imageNamed: "black")

let trans = SKSpriteNode(imageNamed: "trans")


class ChooseBallScene: SKScene, SKPhysicsContactDelegate {

      override func didMoveToView(view: SKView) {
    
       
        backgroundImage.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        backgroundImage.size = self.size
        self.addChild(backgroundImage)
    
       
 
        chooseBall.fontName = "AvenirNext-BoldItalic"
        chooseBall.text = "Unlocked Balls";
        chooseBall.fontSize = 40;
        chooseBall.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.7);
        chooseBall.alpha=0.5
        chooseBall.zPosition=9
        self.addChild(chooseBall)
        
        
        howtoUnlock.fontName = "AvenirNext-Bold"
        howtoUnlock.text = "Unlock new ball at HighScores 10, 20, 30 etc!";
        howtoUnlock.fontSize = 11;
        howtoUnlock.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.62);
        howtoUnlock.alpha=0.5
        howtoUnlock.zPosition=9
        self.addChild(howtoUnlock)
     
        
        tap.fontName = "AvenirNext-BoldItalic"
        tap.text = "Tap to Choose"
        tap.fontSize = 30;
        tap.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) * 1.5);
        tap.alpha=0.5
        tap.zPosition=9
        self.addChild(tap)
        
        
        origBall.position = CGPoint(x:CGRectGetMidX(self.frame) / 2.5, y:CGRectGetMidY(self.frame) * 1.35);
        origBall.size = CGSize(width: 50, height: 50)
        
        self.addChild(origBall)
        
        facea.position = CGPoint(x:CGRectGetMidX(self.frame) / 1.25, y:CGRectGetMidY(self.frame) * 1.35);
        facea.size = CGSize(width: 50, height: 50)
       
        whiteBelt.position = CGPoint(x:CGRectGetMidX(self.frame) * 1.2, y:CGRectGetMidY(self.frame) * 1.35);
        whiteBelt.size = CGSize(width: 50, height: 50)
        
       
        yell.position = CGPoint(x:CGRectGetMidX(self.frame) * 1.6, y:CGRectGetMidY(self.frame) * 1.35);
        yell.size = CGSize(width: 50, height: 50)
        
        or.position = CGPoint(x:CGRectGetMidX(self.frame) / 2.5, y:CGRectGetMidY(self.frame) * 1.05);
        or.size = CGSize(width: 50, height: 50)
        
        green.position = CGPoint(x:CGRectGetMidX(self.frame) / 1.25, y:CGRectGetMidY(self.frame) * 1.05 );
        green.size = CGSize(width: 50, height: 50)
        
        blue.position = CGPoint(x:CGRectGetMidX(self.frame) * 1.2, y:CGRectGetMidY(self.frame) * 1.05 );
        blue.size = CGSize(width: 50, height: 50)
        
        purp.position = CGPoint(x:CGRectGetMidX(self.frame) * 1.6, y:CGRectGetMidY(self.frame) * 1.05 );
        purp.size = CGSize(width: 50, height: 50)
        
        bro.position = CGPoint(x:CGRectGetMidX(self.frame) / 1.7 , y:CGRectGetMidY(self.frame) / 1.3);
        bro.size = CGSize(width: 50, height: 50)
        
        
        red.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) / 1.3);
        red.size = CGSize(width: 50, height: 50)
        
        
        black.position = CGPoint(x:CGRectGetMidX(self.frame) * 1.4, y:CGRectGetMidY(self.frame) / 1.3);
        black.size = CGSize(width: 50, height: 50)
       
       
        
        if highscore > 9 {
        self.addChild(facea)
        }
        
        if highscore > 19 {
            self.addChild(whiteBelt)
        }
        
        if highscore > 29 {
            self.addChild(yell)
        }
        
        if highscore > 39 {
            self.addChild(or)
        }
        
        if highscore > 49 {
            self.addChild(green)
        }
        
        if highscore > 59 {
            self.addChild(blue)
        }
        
        if highscore > 69 {
            self.addChild(purp)
        }
        
        if highscore > 79 {
            self.addChild(bro)
        }
        
        if highscore > 89 {
            self.addChild(red)
        }
        
        if highscore > 99 {
            self.addChild(black)
        }
        
    }
    
        override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
            let gameStartScene = GameStartScene(size: self.frame.size)
            let infoScene = ChooseBallScene(size: self.frame.size)
            var location = CGPoint(x: 0, y: 0)
            var touch : UITouch! = touches.anyObject() as UITouch
            location = touch.locationInNode(self)
            
            if origBall.containsPoint(location) {
                
                
                ball = SKSpriteNode(imageNamed: "ball")
                
                Clicker.play()
                
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                }
            
            if facea.containsPoint(location) && highscore > 9 {
                
                
                ball = SKSpriteNode(imageNamed: "face2")
                
                Clicker.play()
                
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
                }
            if whiteBelt.containsPoint(location) && highscore > 19 {
                
                
                ball = SKSpriteNode(imageNamed: "white")
                
                Clicker.play()
                
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
    
            
            if yell.containsPoint(location) && highscore > 29 {
                
                
                ball = SKSpriteNode(imageNamed: "yell")
                
                Clicker.play()
                
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
            if or.containsPoint(location) && highscore > 39 {
                
                
                ball = SKSpriteNode(imageNamed: "or")
                
                Clicker.play()
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
            if green.containsPoint(location) && highscore > 49 {
                
                
                ball = SKSpriteNode(imageNamed: "green")
                
                Clicker.play()
                
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
            if blue.containsPoint(location) && highscore > 59 {
                
                
                ball = SKSpriteNode(imageNamed: "blue")
                
                Clicker.play()
                
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
            if purp.containsPoint(location) && highscore > 69 {
                
                
                ball = SKSpriteNode(imageNamed: "purp")
                
                Clicker.play()
                
                
                
              self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
            if bro.containsPoint(location) && highscore > 79 {
                
                
                ball = SKSpriteNode(imageNamed: "brown")
                
                Clicker.play()
                
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
            if red.containsPoint(location) && highscore > 89 {
                
                
                ball = SKSpriteNode(imageNamed: "red")
                
                Clicker.play()
                
                
                
                self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
            if black.containsPoint(location) && highscore > 99 {
                
                
                ball = SKSpriteNode(imageNamed: "black")
                
                Clicker.play()
                
                
                
              self.removeChildrenInArray([howtoUnlock,tap,chooseBall,origBall,facea,whiteBelt,yell,or,green,blue,purp,bro,red,black,backgroundImage])
                self.view?.presentScene(gameStartScene)
                
                
            }
}
}
