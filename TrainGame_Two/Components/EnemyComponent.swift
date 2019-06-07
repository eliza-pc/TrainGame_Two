//
//  EnemyComponent.swift
//  TrainGame_Two
//
//  Created by Lucídio Andrade Barbosa de Souza on 06/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import GameplayKit

enum StateEnemy {
    case vigilancia
    case ataque
}

class EnemyComponente: GKComponent{
    
    var state: StateEnemy
    let leftLimit: CGFloat
    let rightLimit: CGFloat
    let initialPosition: CGPoint
    let alvo: SKSpriteNode
    
    
    init(minX: CGFloat, maxX: CGFloat, nodePhysic: SKSpriteNode, initialPoint: CGPoint, gameScene: GameScene) {
        self.leftLimit = minX
        self.rightLimit = maxX
        self.initialPosition = initialPoint
        self.state = .vigilancia
        self.alvo = ((gameScene.childNode(withName: "player") as? SKSpriteNode)!)
        
        super.init()
        
        let leftAction = SKAction.moveTo(x: self.leftLimit, duration: 2.0)
        let dropForRight = SKAction.scaleX(to: nodePhysic.xScale * 1.0, duration: 0.1)
        let rightAction = SKAction.moveTo(x: self.rightLimit, duration: 2.0)
        let dropForleft = SKAction.scaleX(to: nodePhysic.xScale * -1.0, duration: 0.1)
        let sequence = SKAction.repeatForever(SKAction.sequence([leftAction, dropForRight, rightAction, dropForleft]))
        
        nodePhysic.run(sequence)
        
    }
    
    func ataque(autor: SKSpriteNode){
//        autor.removeAllActions()
//
//        if (autor.action(forKey: "vigiando") != nil) {
//            autor.removeAction(forKey: "vigiando")
//        }
//
//        print(autor.hasActions())
//        let positionAtaque = self.alvo.position
//        print("positionAtaque: \(positionAtaque)")
//        let moveAtaque = SKAction.move(to: positionAtaque, duration: 1.0)
//
//        autor.run(moveAtaque, withKey: "atacando")
        
    }
 
    
    func vigiar(autor: SKSpriteNode) {
  
//        autor.removeAllActions()
        if (autor.action(forKey: "atacando") != nil) {
            autor.removeAction(forKey: "atacando")
        }
        autor.run(SKAction.move(to: self.initialPosition, duration: 3.0), withKey: "pontoInicial")
//        autor.removeAllActions()
        if (autor.action(forKey: "pontoInicial") != nil) {
            autor.removeAction(forKey: "pontoInicial")
        }
        let leftAction = SKAction.moveTo(x: self.leftLimit, duration: 1.0)
        let dropForRight = SKAction.scaleX(to: autor.xScale * 1.0, duration: 0.1)
        let rightAction = SKAction.moveTo(x: self.rightLimit, duration: 1.0)
        let dropForleft = SKAction.scaleX(to: autor.xScale * -1.0, duration: 0.1)
        let sequence = SKAction.repeatForever(SKAction.sequence([leftAction, dropForRight, rightAction, dropForleft]))
        autor.run(sequence, withKey: "vigiando")
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
