//
//  BluePowerUp.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/19/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit


class BluePowerUp: PowerUp {
    init() {
        let textureAtlas = Assets.shared.bluePowerUpAtlas // SKTextureAtlas(named: "BluePowerUp")
        super.init(textureAtlas: textureAtlas)
        name = "bluePowerUp"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
