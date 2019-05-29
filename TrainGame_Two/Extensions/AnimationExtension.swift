//
//  AnimationExtension.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 29/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//


import Foundation
import SpriteKit


extension Array where Element == SKTexture {
    
    public static let walk: [SKTexture] = [
        
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_000"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_001"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_002"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_003"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_004"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_005"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_006"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_007"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_008"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_009"),
        
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_010"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_011"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_012"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_013"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_014"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_015"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_016"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_017"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_018"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_019"),
        
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_020"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_021"),
        SKTexture(imageNamed: "Walking/0_Fallen_Angels_Walking_023"),

        ]
    
    public static let idle: [SKTexture] = [
        
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_000"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_001"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_002"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_003"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_004"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_005"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_006"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_007"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_008"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_009"),
        
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_010"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_011"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_012"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_013"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_014"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_015"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_016"),
        SKTexture(imageNamed: "Idle/0_Fallen_Angels_Idle_017"),
 
        ]
  
    
  
    
    
    public static let dicTextures: [String: [SKTexture]] = [
        
        "walk": Array.walk,
        "idle": Array.idle,
    
        ]
    
    
    
}


