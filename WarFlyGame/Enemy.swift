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
    
    init() {
        let texture = Enemy.textureAtlas?.textureNamed("airplane_4ver2_13")
        super.init(texture: texture, color: .clear, size: CGSize(width: 221, height: 204))
        self.xScale = 0.5
        self.yScale = -0.5
        
        self.zPosition = 20
        self.name = "sprite"
        
    }
    
    func flySpiral() {
        let screenSize = UIScreen.main.bounds
        let timeHorizontal: TimeInterval = 3
        let timeVertical: TimeInterval = 10
        
        let moveLeft = SKAction.moveTo(x: 50, duration: timeHorizontal)
        let moveRight = SKAction.moveTo(x: screenSize.width - 50, duration: timeHorizontal)
        
        moveLeft.timingMode = .easeInEaseOut
        moveRight.timingMode = .easeInEaseOut
        
        let asideMovementSequence = SKAction.sequence([moveLeft, moveRight])
        
        let foreverAsideMovement = SKAction.repeatForever(asideMovementSequence)
        
        let forwardMovement = SKAction.moveTo(y: -105, duration: timeVertical)
        
        let groupMovement = SKAction.group([foreverAsideMovement, forwardMovement])
        
        self.run(groupMovement)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
