//
//  Souls.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto


import SpriteKit
import GameplayKit


class SoulEnemy: GKEntity{
    
    init(nodeName: String, gameScene: GameScene, minX: CGFloat, maxX: CGFloat){
        super.init()
        
        let spriteComponent = SpriteComponent(gameScene: gameScene, nodeName: nodeName, textureNodeName: "SoulTextureNode")

        let AnimationAction = SKAction.repeatForever(SKAction.animate(with: .init(withFormat: "Hand-Straight-%d", range: 1...3), timePerFrame: 0.1))


        spriteComponent.nodeTexture.run(AnimationAction)
        spriteComponent.nodePhysic.entity = self
        
        
        let enemyComponent = EnemyComponente(minX: minX, maxX: maxX, nodePhysic: spriteComponent.nodePhysic, initialPoint: CGPoint(x: spriteComponent.nodePhysic.position.x, y: spriteComponent.nodePhysic.position.y), gameScene: gameScene)
        
        addComponent(spriteComponent)
        addComponent(enemyComponent)
        addComponent(DestroyOnContactComponent())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
