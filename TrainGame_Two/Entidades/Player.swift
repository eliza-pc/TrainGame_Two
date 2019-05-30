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
       
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene, nodeName: "player")
//       let texturePlayer = SKTexture.init(imageNamed: imageName)
//       texturePlayer.size().equalTo(CGSize(width: 200, height: 200))
//        spriteComponent.node.texture = texturePlayer
        spriteComponent.node.texture = SKTexture.init(imageNamed: imageName)
        spriteComponent.node.size = CGSize(width: 87.75, height: 116)
//      spriteComponent.node.zPosition = -3
        addComponent(PlayerComponent())
        addComponent(spriteComponent)
        addComponent(MovingCharacterComponent())
        addComponent(spriteComponent)
        addComponent(CameraComponent.init(parentNode: gameScene))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


