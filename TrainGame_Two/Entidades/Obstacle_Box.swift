//
//  Obstacle_Box.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 30/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Obstacle_Box: GKEntity{
    
    enum boxState {
        case grabed
        case notGrabed
    }
    
    init(imageName: String, gameScene: GameScene){
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene)
        spriteComponent.node.texture = SKTexture.init(imageNamed: imageName)
        spriteComponent.node.size = CGSize(width: 200, height: 200)
        
        addComponent(spriteComponent)
        // spriteComponent.node.zPosition = -3
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

