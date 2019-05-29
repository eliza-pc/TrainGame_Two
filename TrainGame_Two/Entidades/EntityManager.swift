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
    
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
    }
    
    
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
    }
    
    func update(dt: TimeInterval) {
        for entity in entities {
            if let cameraComponent = entity.component(ofType: CameraComponent.self), let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {

                        }
            entity.update(deltaTime: dt)
        }
    }
    
}

