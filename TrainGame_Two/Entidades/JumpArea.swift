//
//  DangerArea.swift
//  TrainGame_Two
//
//  Created by Robson James dos Reis Silva Júnior on 09/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class JumpArea: GKEntity {
    
    
    init(nodeName: String,gameScene: GameScene){
        super.init()
        
        let physicComponent = PhysicComponent(gameScene: gameScene, nodeName: nodeName)
        physicComponent.nodePhysic.entity = self
        
        addComponent(physicComponent)
        addComponent(JumpComponent())
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
