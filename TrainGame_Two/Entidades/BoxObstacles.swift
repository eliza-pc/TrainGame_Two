//
//  BoxObstacle.swift
//  TrainGame_Two
//
//  SpeakableComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto


import SpriteKit
import GameplayKit


class BoxObstacle: GKEntity {
    
    init(nodeName: String, gameScene: GameScene){
        super.init()
        
        let spriteComponent = SpriteComponent(gameScene: gameScene, nodeName: nodeName, textureNodeName: "TextureBoxG")
        
        spriteComponent.nodePhysic.entity = self
        
        addComponent(ObstacleComponent())
        addComponent(MovingObjectComponent())
        addComponent(spriteComponent)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
