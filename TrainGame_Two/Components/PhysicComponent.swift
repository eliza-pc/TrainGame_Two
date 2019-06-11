//
//  PhysicComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto


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

