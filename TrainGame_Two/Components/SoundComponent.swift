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


class SoundComponent: GKComponent {
    
    var nodeSoundEffect: SKSpriteNode
    
    init(parentNode: SKSpriteNode, nodeName: String) {
        nodeSoundEffect = (parentNode.childNode(withName: nodeName) as? SKSpriteNode)!
        super.init()
        self.dontVisible()
    }
    
    func dontVisible(){
        nodeSoundEffect.alpha = 0
    }
    
    func soundVisible() {
        nodeSoundEffect.zRotation = .pi / 2
        nodeSoundEffect.alpha = 1
        
        let SoundAction = SKAction.repeatForever(SKAction.animate(with: .init(withFormat: "sondRadio-%d", range: 1...3), timePerFrame: 0.1))
        
        nodeSoundEffect.run(SoundAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

