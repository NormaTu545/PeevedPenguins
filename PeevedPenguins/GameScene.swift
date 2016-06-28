//
//  GameScene.swift
//  PeevedPenguins
//
//  Created by Norma Tu on 6/28/16.
//  Copyright (c) 2016 NormaTu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    /* Game object connections */
    var catapultArm: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Set reference to catapultArm node */
        catapultArm = childNodeWithName("catapultArm") as! SKSpriteNode
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Add a new penguin to the scene */
        let resourcePath = NSBundle.mainBundle().pathForResource("Penguin", ofType: "sks")
        let penguin = MSReferenceNode(URL: NSURL (fileURLWithPath: resourcePath!))
        addChild(penguin)
        
        /* Move penguin to the catapult bucket area */
        penguin.avatar.position = catapultArm.position + CGPoint(x: 32, y: 50)
        
        /* Impulse vector */
        let launchDirection = CGVector(dx: 1, dy: 0)
        let force = launchDirection * 200 //makes sure penguins have enough force to fly
        
        /* Apply impulse to penguin */
        penguin.avatar.physicsBody?.applyImpulse(force)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
}
