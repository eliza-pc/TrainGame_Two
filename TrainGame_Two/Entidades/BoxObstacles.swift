//
//  Souls.swift
//  TrainGame_Two
//
//  Created by Lucídio Andrade Barbosa de Souza on 04/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit


class BoxObstacle: GKEntity {
    
    init(imageName: String, gameScene: GameScene){
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene, nodeName: "PhysicBoxG", textureNodeName: "TextureBoxG")
        
        spriteComponent.nodePhysic.entity = self
        
        addComponent(MovingObjectComponent())
        addComponent(spriteComponent)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
