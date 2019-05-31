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
        spriteComponent.nodeTexture.texture = texturePlayer
        spriteComponent.nodePhysic.size = CGSize(width: 87.75, height: 116)
        addComponent(PlayerComponent())
        addComponent(spriteComponent)
        addComponent(MovingCharacterComponent())
        addComponent(spriteComponent)
        addComponent(CameraComponent.init(parentNode: gameScene))
        addComponent(MovingCharacterComponent())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


