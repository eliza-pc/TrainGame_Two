//
//  DangerArea.swift
//  TrainGame_Two
//
//  Created by Lucídio Andrade Barbosa de Souza on 06/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class DangerArea: GKEntity {
    
    
    init(gameScene: GameScene){
        super.init()
        
        let physicComponent = PhysicComponent(gameScene: gameScene, nodeName: "hotArea")
        physicComponent.nodePhysic.entity = self
        
        addComponent(physicComponent)
        addComponent(HotRegionComponent())
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
