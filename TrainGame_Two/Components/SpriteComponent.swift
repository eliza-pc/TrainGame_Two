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
    
    var nodePhysic: SKSpriteNode
    var nodeTexture: SKSpriteNode
    init(gameScene: GameScene, nodeName: String, textureNodeName: String) {
//        node = SKSpriteNode(texture: texture, color: .white, size: texture.size())
        nodePhysic = (gameScene.childNode(withName: nodeName) as? SKSpriteNode)!
        nodeTexture = nodePhysic.childNode(withName: textureNodeName) as! SKSpriteNode
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

