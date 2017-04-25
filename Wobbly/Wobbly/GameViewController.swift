//
//  GameViewController.swift
//  Balance It
//
//  Created by Andrew Viteri on 1/15/15.
//  Copyright (c) 2015 ViteriGames. All rights reserved.
//

import UIKit
import SpriteKit



extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {
    
   
    
 
   
   
    @IBOutlet weak var bannerView: GADBannerView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let scene = GameStartScene(size:CGSizeMake(self.view.frame.width, self.view.frame.height))
        // Configure the view.
        let skView = self.view as SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
        
        
        self.bannerView.adUnitID = "ca-app-pub-9195841389783394/8859245628"
        self.bannerView.rootViewController = self
        
        var request: GADRequest = GADRequest()
        
       
        
        self.bannerView.loadRequest(request)
        
    
        
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



