//
//  GameSettings.swift
//  WarFlyGame
//
//  Created by Felix Titov on 6/20/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

class GameSettings: NSObject {
    
    let userDefault = UserDefaults.standard
    
    let musicKey = "music"
    let soundKey = "sound"
    
    var isMusic = true
    var isSound = true
    
    override init() {
        super.init()
        
        loadGameSettings()
    }
    
    func saveGameSettings() {
        userDefault.set(isMusic, forKey: musicKey)
        userDefault.set(isSound, forKey: soundKey)
    }
    
    func loadGameSettings() {
        guard
            userDefault.value(forKey: musicKey) != nil &&
                userDefault.value(forKey: soundKey) != nil
        else { return }
        
        isMusic = userDefault.bool(forKey: musicKey)
        isSound = userDefault.bool(forKey: soundKey)
    }
}
