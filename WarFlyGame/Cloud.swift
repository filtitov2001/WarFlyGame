//
//  Cloud.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/12/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit
import GameplayKit

protocol GameBackgroudSpritable {
    static func populate() -> Self
    static func randomPoint() -> CGPoint
}

extension GameBackgroudSpritable {
    static func randomPoint() -> CGPoint {
        let screen = UIScreen.main.bounds
        let distribution = GKRandomDistribution(
            lowestValue: Int(screen.size.height) + 100,
            highestValue: Int(screen.size.height) + 200
        )
        
        let y = CGFloat(distribution.nextInt())
        let x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.width)))
                        
        return CGPoint(x: x, y: y)
                        
    }
}

final class Cloud: SKSpriteNode, GameBackgroudSpritable {
    
    static func populate() -> Cloud {
        let cloudImageName = configireName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = randomPoint()
        cloud.zPosition = 10
        cloud.run(move(from: cloud.position))
        
        return cloud
    }
    
    fileprivate static func configireName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        let randomNumber = distribution.nextInt()
        
        let imageName = "cl" + "\(randomNumber)"
        
        return imageName
    }
    
    fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 20, highestValue: 30)
        let randomNumber = CGFloat(distribution.nextInt()) / 10

        return randomNumber
    }
    
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        
        let movementSpeed: CGFloat = 150.0
        let duration = moveDistance / movementSpeed
        
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
}
