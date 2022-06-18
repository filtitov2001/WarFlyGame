//
//  GameScene.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/11/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var player: PlayerPlane!
    
    override func didMove(to view: SKView) {
        configureStartScene()
        
        spawnClouds()
        spawnIslands()
        player.performFly()
    }
    
    fileprivate func configureStartScene() {
        let screenCentrePoint = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        let background = Background.populateBackground(at: screenCentrePoint)
        background.size = self.size
        
        self.addChild(background)
        
        let screen = UIScreen.main.bounds
        
        let island1 = Island.populate(at: CGPoint(x: 100, y: 200))
        self.addChild(island1)
        
        let island2 = Island.populate(at: CGPoint(x: self.size.width - 100, y: self.size.height - 200))
        self.addChild(island2)
        
        player = PlayerPlane.populate(at: CGPoint(x: screen.size.width / 2, y: 100))
        self.addChild(player)
        
    }
    
    fileprivate func spawnClouds() {
        let spawnCloudWait = SKAction.wait(forDuration: 1)
        let spawnCloudAction = SKAction.run {
            let cloud = Cloud.populate(at: nil)
            self.addChild(cloud)
        }
        
        let spawnCloudSequence = SKAction.sequence([spawnCloudWait, spawnCloudAction])
        let spawnCloudForever = SKAction.repeatForever(spawnCloudSequence)
        run(spawnCloudForever)
    }
    
    fileprivate func spawnIslands() {
        let spawnIslandWait = SKAction.wait(forDuration: 2)
        let spawnIslandAction = SKAction.run {
            let island = Island.populate(at: nil)
            self.addChild(island)
        }
        
        let spawnIslandSequence = SKAction.sequence([spawnIslandWait, spawnIslandAction])
        let spawnIslandForever = SKAction.repeatForever(spawnIslandSequence)
        run(spawnIslandForever)
    }
    
    override func didSimulatePhysics() {
        
        player.checkPosition()
        
        enumerateChildNodes(withName: "backgroundSprite") { node, stop in
            if node.position.y < -199 {
                node.removeFromParent()
            }
        }
        
    }
}
