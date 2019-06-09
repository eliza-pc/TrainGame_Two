//
//  Souls.swift
//  TrainGame_Two
//
//  Created by Lucídio Andrade Barbosa de Souza on 04/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit


class SoulEnemy: GKEntity{
    
    init(nodeName: String, gameScene: GameScene){
        super.init()
        
        let spriteComponent = SpriteComponent(gameScene: gameScene, nodeName: nodeName, textureNodeName: "SoulTextureNode")

        let AnimationAction = SKAction.repeatForever(SKAction.animate(with: .init(withFormat: "Hand-Straight-%d", range: 1...3), timePerFrame: 0.1))


        spriteComponent.nodeTexture.run(AnimationAction)
        spriteComponent.nodePhysic.entity = self
        
        
        let enemyComponent = EnemyComponente(minX: 1200, maxX: 1520, nodePhysic: spriteComponent.nodePhysic, initialPoint: CGPoint(x: spriteComponent.nodePhysic.position.x, y: spriteComponent.nodePhysic.position.y), gameScene: gameScene)
        
        addComponent(spriteComponent)
        addComponent(enemyComponent)
        addComponent(DestroyOnContactComponent())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
