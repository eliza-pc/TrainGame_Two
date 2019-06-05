//
//  EntityManager.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 27/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    
    
    var entities = Set<GKEntity>()
    let scene: SKScene
    var entityInContact: GKEntity? = nil
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
       
    }
    
    
    func remove(_ entity: GKEntity) {
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.nodePhysic {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
        for entity in entities {
            print("entity: \(entity)")
        }
        print("tamanho: \(entities.count)")
        
    }
    
    func update(dt: TimeInterval) {
        for entity in entities {
//            if let cameraComponent = entity.component(ofType: CameraComponent.self), let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
//
//            }
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
    
}

