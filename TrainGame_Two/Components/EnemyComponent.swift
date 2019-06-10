//
//  EnemyComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto


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
    let enemySpeed: CGFloat = 1
    
    init(minX: CGFloat, maxX: CGFloat, nodePhysic: SKSpriteNode, initialPoint: CGPoint, gameScene: GameScene) {
        self.leftLimit = minX
        self.rightLimit = maxX
        self.initialPosition = initialPoint
        self.state = .vigilancia
        self.alvo = ((gameScene.childNode(withName: "player") as? SKSpriteNode)!)
        
        super.init()
        let leftAction = SKAction.moveTo(x: self.leftLimit, duration: 2.0)
        let dropForRight = SKAction.scaleX(to: nodePhysic.xScale * -1.0, duration: 0.001)
        let rightAction = SKAction.moveTo(x: self.rightLimit, duration: 2.0)
        let dropForleft = SKAction.scaleX(to: nodePhysic.xScale * 1.0, duration: 0.001)
        
        let sequence = SKAction.repeatForever(SKAction.sequence([leftAction, dropForRight, rightAction, dropForleft]))
        
        nodePhysic.run(sequence, withKey: "vigiando")
        
    }
    
    func ataque(autor: SKSpriteNode){

//        print("xScale: \(autor.xScale)")
        
        if (autor.action(forKey: "vigiando") != nil) {
            
            autor.removeAction(forKey: "vigiando")
            
        }
        
        if (autor.action(forKey: "pontoInicial") != nil) {
            
            autor.removeAction(forKey: "pontoInicial")
       
        }

        let location = self.alvo.position
        
        let dx = (location.x) - autor.position.x
        let dy = (location.y) - autor.position.y
        let angle = atan2(dy, dx)

        
        //Seek
        let velocityX = cos(angle) * self.enemySpeed
        let velocityY = sin(angle) * self.enemySpeed
        
        let direction = Int(autor.position.x - self.alvo.position.x)
//        print(direction)
        
        if direction >= 0 {
            autor.xScale = abs(autor.xScale) * 1.0
        } else {
            autor.xScale = abs(autor.xScale) * -1.0
        }
        
        
        autor.position.x += velocityX
        autor.position.y += velocityY
        
    }
 
    
    func vigiar(autor: SKSpriteNode) {

//        print("xScale: \(autor.xScale)")
//        print(direction)
        
        autor.run(SKAction.moveTo(y: self.initialPosition.y, duration: 2.25), withKey: "pontoInicial")
        autor.xScale = abs(autor.xScale) * 1.0
        let leftAction = SKAction.moveTo(x: self.leftLimit, duration: 2.0)
        let dropForRight = SKAction.scaleX(to: autor.xScale * -1.0, duration: 0.001)
        let rightAction = SKAction.moveTo(x: self.rightLimit, duration: 2.0)
        let dropForleft = SKAction.scaleX(to: autor.xScale * 1.0, duration: 0.001)
        
        let sequence = SKAction.repeatForever(SKAction.sequence([leftAction, dropForRight, rightAction, dropForleft]))
        autor.run(sequence, withKey: "vigiando")
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
