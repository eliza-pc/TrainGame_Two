//
//  EntityManager.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto


import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    
    
    var entities = Set<GKEntity>()
    let scene: SKScene
    var entityInContact: GKEntity? = nil
    var contactObjects: Bool = false
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
//        printEntities()
    }
    
    
    func remove(_ entity: GKEntity) {
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.nodePhysic {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
//        printEntities()
        
    }
    
    func update(dt: TimeInterval) {
        for entity in entities {
            if let balloonComponent = entity.component(ofType: BalloonComponent.self), !contactObjects {
                balloonComponent.isNotVisible()
            }
            
            if let enemyComponent = entity.component(ofType: EnemyComponente.self), entity.component(ofType: EnemyComponente.self)?.state == StateEnemy.ataque {
                enemyComponent.ataque(autor: entity.component(ofType: SpriteComponent.self)!.nodePhysic)
            }
            
            if let _ = entity.component(ofType: EnemyComponente.self), let luminosidade: CGFloat = UIScreen.main.brightness {
                print("luz: \(luminosidade)")
                guard let autorNode = entity.component(ofType: SpriteComponent.self)?.nodeTexture else { return  }
                
                entity.component(ofType: EnemyComponente.self)?.isVisibleWithBrigthess(lum: luminosidade, autor: autorNode)
                
            }
        
            entity.update(deltaTime: dt)
        }
    }
    
    
    
    func getEntitys(component: GKComponent.Type) -> [GKEntity] {
        var entitys: [GKEntity] = []
        
        for entity in entities {
            if (entity.component(ofType: component.self) != nil) {
                entitys.append(entity)
            }
        }
        
        return entitys
    }
    
    
    func setObjectInContact(entity: GKEntity ){
        self.entityInContact = entity
    }
    
    
    func getObjectInContact() -> GKEntity? {
        let entityContact = self.entityInContact
        return entityContact
    }
    
    func printEntities(){
        
        for entity in entities {
            print("entitiy: \(entity)")
        }
        print("entities Count: \(entities.count)")
        print("\n ---- [end] ---- \n")
    }
    
}

