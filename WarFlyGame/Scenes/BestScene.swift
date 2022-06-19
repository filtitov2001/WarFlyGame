//
//  BestScene.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/19/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit

class BestScene: ParentScene {
    
    var scores = [10, 100, 10000]
    
    override func didMove(to view: SKView) {
        
        setHeader(withName: "best", andBackground: "header_background")
        
        let titles = ["back"]
        
        for (index, title) in titles.enumerated() {
            let button = ButtonNode(titled: title, backgroundName: "button_background")
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200 + CGFloat(100 * index))
            button.name = title
            button.label.name = title
            addChild(button)
        }
        
        let topScores = scores.sorted { $0 > $1 }.prefix(3)
        
        for (index, value) in topScores.enumerated() {
            let scoreLabel = SKLabelNode(text: value.description)
            scoreLabel.fontColor = UIColor(red: 219 / 255, green: 226 / 255, blue: 215 / 255, alpha: 1.0)
            scoreLabel.fontName = "AmericanTypewriter-Bold"
            scoreLabel.fontSize = 30
            scoreLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(index * 60))
            
            addChild(scoreLabel)
        }
    
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let gameScene  = sceneManager.gameScene {
            if !gameScene.isPaused {
                gameScene.isPaused = true
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "back" {
            
            let transition = SKTransition.crossFade(withDuration: 1.0)
            guard let backScene = backScene else { return }
            backScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(backScene, transition: transition)
        }
    }
}
