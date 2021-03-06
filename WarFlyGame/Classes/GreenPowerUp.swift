//
//  GreenPowerUp.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/19/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit

class GreenPowerUp: PowerUp {
    init() {
        let textureAtlas = Assets.shared.greenPowerUpAtlas // SKTextureAtlas(named: "GreenPowerUp")
        super.init(textureAtlas: textureAtlas)
        name = "greenPowerUp"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
