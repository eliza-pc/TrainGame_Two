//
//  Player.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho on 22/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//


import SpriteKit
import GameplayKit

class Player: GKEntity{
    
    init(imageName: String, gameScene: GameScene){
        super.init()
       
    let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene, nodeName: "player", textureNodeName: "texturePlayer")
        
  
    let texturePlayer = SKTexture.init(imageNamed: imageName)
        //       texturePlayer.size().equalTo(CGSize(width: 200, height: 200))
        //        spriteComponent.node.texture = SKTexture.init(imageNamed: imageName)
        //      spriteComponent.node.zPosition = -3
    
       // _ = SoundPlayer.soundPlayer.playBackgroundMusic(backgroundMusicName: sound)
        
        spriteComponent.nodeTexture.texture = texturePlayer
        spriteComponent.nodePhysic.size = CGSize(width: 87.75, height: 116)
        BackgroundMusicClass.backgroundMusic.playBackgroundMusic()
        BackgroundTrainSound.backgroundTrainSound.playBackgroundTrainSound()
        
//        // Quem sou eu?
//        spriteComponent.nodePhysic.physicsBody?.categoryBitMask    = 0b0001
//        // De quem eu recebo colisões?
//        spriteComponent.nodePhysic.physicsBody?.collisionBitMask   = 0b0111
//        // De quem eu recebo contato?
//        spriteComponent.nodePhysic.physicsBody?.contactTestBitMask = 0b0001
        
        
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


