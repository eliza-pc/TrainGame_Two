//
//  AnimationsExtension.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 29/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import SpriteKit


extension Array where Element == SKTexture {
    
    public static let walk: [SKTexture] = [
        
        SKTexture(imageNamed: "Walk_anim/walk_0"),
        SKTexture(imageNamed: "Walk_anim/walk_1"),
        SKTexture(imageNamed: "Walk_anim/walk_2"),
        SKTexture(imageNamed: "Walk_anim/walk_3"),
        SKTexture(imageNamed: "Walk_anim/walk_4"),
        SKTexture(imageNamed: "Walk_anim/walk_5"),
        SKTexture(imageNamed: "Walk_anim/walk_6"),
        SKTexture(imageNamed: "Walk_anim/walk_7"),
        SKTexture(imageNamed: "Walk_anim/walk_8"),
        SKTexture(imageNamed: "Walk_anim/walk_9"),
        
        SKTexture(imageNamed: "Walk_anim/walk_10"),
        SKTexture(imageNamed: "Walk_anim/walk_11"),
        SKTexture(imageNamed: "Walk_anim/walk_12"),
        SKTexture(imageNamed: "Walk_anim/walk_13"),
        SKTexture(imageNamed: "Walk_anim/walk_14"),
        SKTexture(imageNamed: "Walk_anim/walk_15"),
        SKTexture(imageNamed: "Walk_anim/walk_16"),
        SKTexture(imageNamed: "Walk_anim/walk_17"),
        SKTexture(imageNamed: "Walk_anim/walk_18"),
        SKTexture(imageNamed: "Walk_anim/walk_19"),
        
        SKTexture(imageNamed: "Walk_anim/walk_20"),
        SKTexture(imageNamed: "Walk_anim/walk_21"),
        SKTexture(imageNamed: "Walk_anim/walk_22"),
        SKTexture(imageNamed: "Walk_anim/walk_23"),
        
        ]
    
    public static let idle: [SKTexture] = [
        
        SKTexture(imageNamed: "Idle_anim/Idle_0"),
        SKTexture(imageNamed: "Idle_anim/Idle_1"),
        SKTexture(imageNamed: "Idle_anim/Idle_2"),
        SKTexture(imageNamed: "Idle_anim/Idle_3"),
        SKTexture(imageNamed: "Idle_anim/Idle_4"),
        SKTexture(imageNamed: "Idle_anim/Idle_5"),
        SKTexture(imageNamed: "Idle_anim/Idle_6"),
        SKTexture(imageNamed: "Idle_anim/Idle_7"),
        SKTexture(imageNamed: "Idle_anim/Idle_8"),
        SKTexture(imageNamed: "Idle_anim/Idle_9"),
        
        SKTexture(imageNamed: "Idle_anim/Idle_10"),
        SKTexture(imageNamed: "Idle_anim/Idle_11"),
        SKTexture(imageNamed: "Idle_anim/Idle_12"),
        SKTexture(imageNamed: "Idle_anim/Idle_13"),
        SKTexture(imageNamed: "Idle_anim/Idle_14"),
        SKTexture(imageNamed: "Idle_anim/Idle_15"),
        SKTexture(imageNamed: "Idle_anim/Idle_16"),
        
    ]
    
 
    
    
    public static let dicTextures: [String: [SKTexture]] = [
        
        "walk": Array.walk,
        "idle": Array.idle,
        
        ]
    
    
    
}
