//
//  Island.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/12/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit
import GameplayKit

final class Island: SKSpriteNode, GameBackgroudSpritable {
    
    static func populateSprite(at point: CGPoint) -> Island {
        let islandImageName = configireName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = point
        island.zPosition = 1
        island.run(rotateForRandomAngle())
        island.run(move(from: point))
        
        return island
    }
    
    fileprivate static func configireName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        let randomNumber = distribution.nextInt()
        
        let imageName = "is" + "\(randomNumber)"
        
        return imageName
    }
    
    fileprivate static func rotateForRandomAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        
        return SKAction.rotate(toAngle: randomNumber * CGFloat(Double.pi / 180), duration: 0)
    }
    
    fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        let randomNumber = CGFloat(distribution.nextInt()) / 10
        
        return randomNumber
    }
    
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        
        let movementSpeed: CGFloat = 10.0
        let duration = moveDistance / movementSpeed
        
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
}
