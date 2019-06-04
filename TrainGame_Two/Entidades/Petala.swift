//
//  Player.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho on 22/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//


import SpriteKit
import GameplayKit

class Petala: GKEntity{
    
    
    init(imageName: String, gameScene: GameScene){
        super.init()
        
//    let texturePetal = SKTexture.init(imageNamed: imageName)
      
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene, nodeName: "nodePetal", textureNodeName: "texturePetal")
    
        // Quem sou eu?
        spriteComponent.nodePhysic.physicsBody?.categoryBitMask    = 0b0010
        // De quem eu recebo colisões?
        spriteComponent.nodePhysic.physicsBody?.collisionBitMask   = 0b0000
        // De quem eu recebo contato?
        spriteComponent.nodePhysic.physicsBody?.contactTestBitMask = 0b0001
        
        spriteComponent.nodePhysic.entity = self
        
        addComponent(spriteComponent)
        addComponent(CollectableComponent())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}
