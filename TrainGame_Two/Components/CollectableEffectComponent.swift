//
//  SoundComponent.swift
//  TrainGame_Two
//
//  Created by Robson James Junior on 11/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//
//

import SpriteKit
import GameplayKit


class CollectableEffectComponent: GKComponent {
    
    var nodePetalEffect: SKSpriteNode
    
    init(parentNode: SKSpriteNode, nodeName: String) {
        nodePetalEffect = (parentNode.childNode(withName: nodeName) as? SKSpriteNode)!
        super.init()
        let SoundAction = SKAction.repeatForever(SKAction.animate(with: .init(withFormat: "sondRadio-%d", range: 1...3), timePerFrame: 0.1))
        nodePetalEffect.run(SoundAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
