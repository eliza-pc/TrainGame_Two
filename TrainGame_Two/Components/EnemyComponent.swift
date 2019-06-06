//
//  EnemyComponent.swift
//  TrainGame_Two
//
//  Created by Lucídio Andrade Barbosa de Souza on 06/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import GameplayKit

class EnemyComponente: GKComponent{
    
    enum stateEnemy {
        case vigilancia
        case ataque
    }
    
    let leftLimit: CGFloat
    let rightLimit: CGFloat
    
    init(minX: CGFloat, maxX: CGFloat, nodePhysic: SKSpriteNode) {
        self.leftLimit = minX
        self.rightLimit = maxX
        
        super.init()
        
        let leftAction = SKAction.moveTo(x: self.leftLimit, duration: 2.0)
        let dropForRight = SKAction.scaleX(to: nodePhysic.xScale * -1.0, duration: 0.1)
        let rightAction = SKAction.moveTo(x: self.rightLimit, duration: 2.0)
        let dropForleft = SKAction.scaleX(to: nodePhysic.xScale * 1.0, duration: 0.1)
        let sequence = SKAction.repeatForever(SKAction.sequence([leftAction, dropForRight, rightAction, dropForleft]))
        
        nodePhysic.run(sequence)
        
    }
    
    func ataque(alvo: SKSpriteNode, autor: SKSpriteNode){
        autor.removeAllActions()
        
        let positionAtaque = alvo.position
        
        let moveAtaque = SKAction.repeatForever(SKAction.move(to: positionAtaque, duration: 0.5))
        
        autor.run(moveAtaque)
        
    }
    
    func vigiar(autor: SKSpriteNode) {
        autor.removeAllActions()
        
        let leftAction = SKAction.moveTo(x: self.leftLimit, duration: 1.0)
        let dropForRight = SKAction.scaleX(to: autor.xScale * 1.0, duration: 0.1)
        let rightAction = SKAction.moveTo(x: self.rightLimit, duration: 1.0)
        let dropForleft = SKAction.scaleX(to: autor.xScale * -1.0, duration: 0.1)
        let sequence = SKAction.repeatForever(SKAction.sequence([leftAction, dropForRight, rightAction, dropForleft]))
        
        autor.run(sequence)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
