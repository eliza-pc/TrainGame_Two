//
//  SoundBox.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto



import SpriteKit
import GameplayKit

class SoundBox: GKEntity{
    
    
    init(nodeName: String, gameScene: GameScene){
        super.init()
        
        
        let spriteComponent = SpriteComponent(gameScene: gameScene, nodeName: nodeName, textureNodeName: "textureSoundBox")
    
        spriteComponent.nodePhysic.entity = self
        
        let balloonComponent = BalloonComponent(parentNode: spriteComponent.nodePhysic, balloonNodeName: "textureBalao")
        
        let soundAnimationComponent = SoundComponent(parentNode: spriteComponent.nodePhysic, nodeName: "soundEffect")
        
        addComponent(soundAnimationComponent)
        addComponent(balloonComponent)
        addComponent(spriteComponent)
        addComponent(SpeakableComponent())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}