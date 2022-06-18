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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
