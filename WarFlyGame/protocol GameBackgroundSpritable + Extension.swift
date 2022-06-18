//
//  protocol GameBackgroundSpritable + Extension.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/18/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit
import GameplayKit

protocol GameBackgroudSpritable {
    static func populate(at point: CGPoint?) -> Self
    static func randomPoint() -> CGPoint
}

extension GameBackgroudSpritable {
    static func randomPoint() -> CGPoint {
        let screen = UIScreen.main.bounds
        let distribution = GKRandomDistribution(
            lowestValue: Int(screen.size.height) + 400,
            highestValue: Int(screen.size.height) + 500
        )
        
        let y = CGFloat(distribution.nextInt())
        let x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.width)))
                        
        return CGPoint(x: x, y: y)
                        
    }
}
