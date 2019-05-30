//
//  SpriteComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 27/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit


class SpriteComponent: GKComponent {
    
    var node: SKSpriteNode
    
    init(texture: SKTexture, gameScene: GameScene) {
        node = SKSpriteNode(texture: texture, color: .white, size: texture.size())
        node = (gameScene.childNode(withName: "player") as? SKSpriteNode)!
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

