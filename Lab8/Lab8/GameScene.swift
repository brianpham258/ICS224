//
//  GameScene.swift
//  Lab8
//
//  Created by Brian Pham on 2020-03-21.
//  Copyright © 2020 ics057. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var sprite : SKSpriteNode!
    var opponentSprite: SKSpriteNode!
    let spriteCategory1: UInt32 = 0b1
    let spriteCategory2: UInt32 = 0b10
    
    override func didMove(to view: SKView) {
        // Player's character
        sprite = SKSpriteNode(imageNamed: "GameSprite")
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        sprite.size = CGSize(width: 100, height: 100)
        addChild(sprite)
        
        // Opponent
        opponentSprite = SKSpriteNode(imageNamed: "OpponentSprite")
        opponentSprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        opponentSprite.size = CGSize(width: 100, height: 100)
        addChild(opponentSprite)
        
        // Opponent move up and down only
//        let downMovement = SKAction.move(to: CGPoint(x: size.width / 2, y: 0), duration: 1)
//        let upMovement = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height), duration: 1)
//        let movement = SKAction.sequence([downMovement, upMovement])
//        opponentSprite.run(SKAction.repeatForever(movement))
        moveOpponent()
        
        // Collider
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        opponentSprite.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        
        sprite.physicsBody?.categoryBitMask = spriteCategory2
        sprite.physicsBody?.contactTestBitMask = spriteCategory1
        sprite.physicsBody?.collisionBitMask = spriteCategory1
        opponentSprite.physicsBody?.categoryBitMask = spriteCategory1
        opponentSprite.physicsBody?.contactTestBitMask = spriteCategory1
        opponentSprite.physicsBody?.collisionBitMask = spriteCategory1
        
        self.physicsWorld.contactDelegate = self
    }
    
    func moveOpponent() {
        // Opponent move randomly
        let randomX = GKRandomSource.sharedRandom().nextInt(upperBound: Int(size.width))
        let randomY = GKRandomSource.sharedRandom().nextInt(upperBound: Int(size.height))
        let movement = SKAction.move(to: CGPoint(x: randomX, y: randomY), duration: 1)
        opponentSprite.run(movement, completion: { self.moveOpponent() })
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("Hit!")
    }
    
    func touchDown(atPoint pos : CGPoint) {
        // Player move
        sprite.run(SKAction.move(to: pos, duration: 1))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        // Player stop moving
        sprite.run(SKAction.move(to: pos, duration: 1))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
