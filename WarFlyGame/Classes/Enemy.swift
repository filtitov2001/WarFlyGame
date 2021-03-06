//
//  Enemy.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/18/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit

class Enemy: SKSpriteNode {

    static var textureAtlas: SKTextureAtlas?
    var enemyTexture: SKTexture!
    
    init(enemyTexture: SKTexture) {
        let texture = enemyTexture
        super.init(texture: texture, color: .clear, size: CGSize(width: 221, height: 204))
        
        self.xScale = 0.5
        self.yScale = -0.5
        
        self.zPosition = 20
        self.name = "sprite"
        
        self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.5, size: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = BitMaskCategory.enemy.rawValue
        self.physicsBody?.collisionBitMask = BitMaskCategory.none.rawValue
        self.physicsBody?.contactTestBitMask = BitMaskCategory.player.rawValue | BitMaskCategory.shot.rawValue
        
    }
    
    func flySpiral() {
        let screenSize = UIScreen.main.bounds
        
        let timeHorizontal: TimeInterval = 3
        let timeVertical: TimeInterval = 5
        
        let moveLeft = SKAction.moveTo(x: 50, duration: timeHorizontal)
        let moveRight = SKAction.moveTo(x: screenSize.width - 50, duration: timeHorizontal)
        
        moveLeft.timingMode = .easeInEaseOut
        moveRight.timingMode = .easeInEaseOut
        
        let randomNumber = Int(arc4random_uniform(2))
        
        let asideMovementSequence = randomNumber == EnemyDirection.left.rawValue
        ? SKAction.sequence([moveLeft, moveRight])
        : SKAction.sequence([moveRight, moveLeft])
        
        let foreverAsideMovement = SKAction.repeatForever(asideMovementSequence)
        
        let forwardMovement = SKAction.moveTo(y: -105, duration: timeVertical)
        let groupMovement = SKAction.group([foreverAsideMovement, forwardMovement])
        
        self.run(groupMovement)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum EnemyDirection: Int {
    case left = 0
    case right
}
