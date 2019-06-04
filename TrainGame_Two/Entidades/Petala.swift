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
        
        spriteComponent.nodePhysic.size = CGSize(width: 87.75, height: 116)
    
        addComponent(spriteComponent)
        addComponent(CollectableComponent())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}
