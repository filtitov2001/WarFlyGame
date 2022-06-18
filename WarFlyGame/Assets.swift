//
//  Assets.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/19/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit

class Assets {
    static let shared = Assets()
    
    let yellowShotAtlas = SKTextureAtlas(named: "YellowShot")
    let enemy1Atlas = SKTextureAtlas(named: "Enemy_1")
    let enemy2Atlas = SKTextureAtlas(named: "Enemy_2")
    let greenPowerUpAtlas = SKTextureAtlas(named: "GreenPowerUp")
    let bluePowerUpAtlas = SKTextureAtlas(named: "BluePowerUp")
    let playerPlaneAtlas = SKTextureAtlas(named: "PlayerPlane")
    
    private init() {}
    
    func preloadAssets() {
        yellowShotAtlas.preload { print("yellowShotAtlas preloaded") }
        enemy1Atlas.preload { print("enemy1Atlas preloaded") }
        enemy2Atlas.preload { print("enemy2Atlas preloaded") }
        greenPowerUpAtlas.preload { print("greenPowerUpAtlas preloaded") }
        bluePowerUpAtlas.preload { print("bluePowerUpAtlas preloaded") }
        playerPlaneAtlas.preload { print("playerPlaneAtlas preloaded") }
    }
}
