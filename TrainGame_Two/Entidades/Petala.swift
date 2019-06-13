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
       
        spriteComponent.nodePhysic.entity = self
        
        
//        let balloonComponent = BalloonComponent(parentNode: spriteComponent.nodePhysic, balloonNodeName: "textureBalao")
//        addComponent(balloonComponent)
        
        let collectableAnimationComponent = CollectableEffectComponent(parentNode: spriteComponent.nodePhysic, nodeName: "textureAn")
        
        let aument = SKAction.scale(to: 1.0, duration: 1.0)
        let dim = SKAction.scale(to: 0.85, duration: 1.0)
        
        spriteComponent.nodeTexture.run(SKAction.repeatForever(SKAction.sequence([aument, dim])))
        
        spriteComponent.nodePhysic.alpha = 1
        addComponent(collectableAnimationComponent)
        addComponent(spriteComponent)
        addComponent(CollectableComponent())
        addComponent(DestroyOnContactComponent())
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}
