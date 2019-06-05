//
//  Souls.swift
//  TrainGame_Two
//
//  Created by Lucídio Andrade Barbosa de Souza on 04/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit


class Souls: GKEntity{
    
    init(imageName: String, gameScene: GameScene){
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene, nodeName: "Souls", textureNodeName: "???")

        let AnimationAction = SKAction.repeatForever(SKAction.animate(with: .init(withFormat: "Hand-Left-Down-%d", range: 1...3), timePerFrame: 0.3))
        
        
//        let texturePlayer = SKTexture.init(imageNamed: imageName)
//
//        spriteComponent.nodeTexture.texture = texturePlayer
//        spriteComponent.nodePhysic.size = CGSize(width: 87.75, height: 116)
//        addComponent(PlayerComponent())
//        addComponent(spriteComponent)
//        addComponent(spriteComponent)
//        addComponent(CameraComponent.init(parentNode: gameScene))
//
//        
//        let stateMachineComponent = StateMachineComponent()
//        addComponent(stateMachineComponent)
//        stateMachineComponent.stateMachine.enter(IdleState.self)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
