//
//  SpriteComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 27/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit


class PhysicComponent: GKComponent {
    
    var nodePhysic: SKSpriteNode
    
    init(gameScene: GameScene, nodeName: String) {
        nodePhysic = (gameScene.childNode(withName: nodeName) as? SKSpriteNode)!
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

