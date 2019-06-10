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

class Player: GKEntity{
    
    init(nodeName: String, gameScene: GameScene){
        super.init()
       
    let spriteComponent = SpriteComponent(gameScene: gameScene, nodeName: nodeName, textureNodeName: "texturePlayer")
  
        spriteComponent.nodePhysic.size = CGSize(width: 87.75, height: 116)
        //        spriteComponent.nodeTexture.size = CGSize(width: 131.625, height: 174)
        BackgroundMusicClass.backgroundMusic.playBackgroundMusic()
        BackgroundTrainSound.backgroundTrainSound.playBackgroundTrainSound()
        
        spriteComponent.nodePhysic.entity = self
        
        addComponent(PlayerComponent())
        addComponent(spriteComponent)
        addComponent(CameraComponent.init(parentNode: gameScene))
   
        
        let stateMachineComponent = StateMachineComponent()
        addComponent(stateMachineComponent)
        stateMachineComponent.stateMachine.enter(IdleState.self)
        
    }
    
   
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


