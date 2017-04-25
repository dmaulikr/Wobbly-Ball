//
//  GameOverScene.swift
//  Wobbly
//
//  Created by Andrew Viteri on 1/19/15.
//  Copyright (c) 2015 ViteriGames. All rights reserved.
//

import Foundation
import SpriteKit



var replayButton = SKSpriteNode(imageNamed: "replay")
var menuButton = SKSpriteNode(imageNamed: "menu")
var highScoreLabel = SKLabelNode()
var scoreLabela = SKLabelNode()
var defaults = NSUserDefaults()
var highscore = defaults.integerForKey("highScore")
var highscoreShow = defaults.integerForKey("highScore")

var newScore = SKLabelNode()



class GameOverScene: SKScene {
    
    
    
    override func didMoveToView(view: SKView) {
        
        
        
        if (score > highscore) {
            defaults.setInteger(score, forKey: "highScore")
           
            highscore = score
        
            self.addChild(newScore)
            
      
        }
        
      
        
       
        backgroundImage.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        backgroundImage.size = self.size
        self.addChild(backgroundImage)
        
        menuButton.position = CGPoint(x:CGRectGetMidX(self.frame) / 1.5, y:CGRectGetMidY(self.frame)/1.3);
        menuButton.size = CGSize(width: 90, height: 55)
        self.addChild(menuButton)
        
        
        replayButton.position = CGPoint(x:CGRectGetMidX(self.frame)*1.3, y:CGRectGetMidY(self.frame)/1.3);
        replayButton.size = CGSize(width: 90, height: 55)
        self.addChild(replayButton)
        
      
        
        
        
        newScore.fontName = "AvenirNext-BoldItalic"
        
        
        
        newScore.text = "NEW";
        
        
        newScore.fontSize = 40;
       
        newScore.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)/1.1);
        newScore.alpha=0.6
        newScore.zPosition=9
       
        
        highScoreLabel.fontName = "AvenirNext-BoldItalic"
       
        
      
        highScoreLabel.text = "High Score:\(highscore)";
        
        
        highScoreLabel.fontSize = 40;
        highScoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.1);
        highScoreLabel.alpha=0.6
        highScoreLabel.zPosition=9
        self.addChild(highScoreLabel)
        
        
        
        scoreLabela.fontName = "Verdana"
        scoreLabela.text = "\(score)";
        scoreLabela.fontSize = 230;
        scoreLabela.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)*1.28);
        scoreLabela.alpha=0.4
        scoreLabela.zPosition=8
        self.addChild(scoreLabela)
        
            
        
    }

    
    
   
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let gamestartScene = GameStartScene(size: self.frame.size)
        let replayScene = GameScene(size: self.frame.size)
        var location = CGPoint(x: 0, y: 0)
        var touch = touches.anyObject() as UITouch
        location = touch.locationInNode(self)
        
        
        
        if menuButton.containsPoint(location){
       self.removeChildrenInArray([menuButton,replayButton,highScoreLabel,scoreLabela,newScore,backgroundImage])
            self.view?.presentScene(gamestartScene)
            println("button pressed")
            Clicker.play()
        score = 0
        
        }
        if replayButton.containsPoint(location){
            self.removeChildrenInArray([menuButton,replayButton,highScoreLabel,scoreLabela,newScore,backgroundImage])
            self.view?.presentScene(replayScene)
            println("button pressed")
            score = 0
            Clicker.play()
            
          
        }
    
    }
    
    
    
}