//
//  Player.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho on 22/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//


import SpriteKit
import GameplayKit

class Player: GKEntity{
    
    init(imageName: String, gameScene: GameScene){
        super.init()
        
        
        
        
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene)
        spriteComponent.node.texture = SKTexture.init(imageNamed: imageName)
        addComponent(spriteComponent)
        spriteComponent.node.zPosition = -3
        
        addComponent(spriteComponent)
        addComponent(CameraComponent.init(parentNode: gameScene))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


