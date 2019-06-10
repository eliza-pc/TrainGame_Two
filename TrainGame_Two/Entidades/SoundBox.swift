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
    
    
    init(nodeName: String, gameScene: GameScene){
        super.init()
        
        
        let spriteComponent = SpriteComponent(gameScene: gameScene, nodeName: nodeName, textureNodeName: "textureSoundBox")
    
        spriteComponent.nodePhysic.entity = self
        
        let balloonComponent = BalloonComponent(parentNode: spriteComponent.nodePhysic, balloonNodeName: "textureBalao")
        
      
        addComponent(balloonComponent)
        addComponent(spriteComponent)
        addComponent(SpeakableComponent())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
