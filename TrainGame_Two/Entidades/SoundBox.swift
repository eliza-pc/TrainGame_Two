//
//  SoundBox.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 06/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//


import SpriteKit
import GameplayKit

class SoundBox: GKEntity{
    
    
    init(imageName: String, gameScene: GameScene){
        super.init()
        
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene, nodeName: "nodeSoundBox", textureNodeName: "textureSoundBox")
    
        
        spriteComponent.nodePhysic.entity = self
        let balloonComponent = BalloonComponent(parentNode: spriteComponent.nodePhysic, balloonNodeName: "textureBalaoMentor")
        
      
        addComponent(balloonComponent)
        addComponent(spriteComponent)
        addComponent(CollectableComponent())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
