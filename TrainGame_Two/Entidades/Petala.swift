//
//  Player.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto



import SpriteKit
import GameplayKit

class Petala: GKEntity{
    
    
    init(nodeName: String, gameScene: GameScene){
        super.init()
      
        let spriteComponent = SpriteComponent(gameScene: gameScene, nodeName: nodeName, textureNodeName: "texturePetal")
        
       
    
//        // Quem sou eu?
//        spriteComponent.nodePhysic.physicsBody?.categoryBitMask    = 0b0010
//        // De quem eu recebo colisões?
//        spriteComponent.nodePhysic.physicsBody?.collisionBitMask   = 0b0000
//        // De quem eu recebo contato?
//        spriteComponent.nodePhysic.physicsBody?.contactTestBitMask = 0b0001
        
       
        spriteComponent.nodePhysic.entity = self
        let balloonComponent = BalloonComponent(parentNode: spriteComponent.nodePhysic, balloonNodeName: "textureBalao")
        
    
        
        addComponent(balloonComponent)
        addComponent(spriteComponent)
        addComponent(CollectableComponent())
        addComponent(DestroyOnContactComponent())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}
