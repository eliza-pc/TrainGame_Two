//
//  balloonComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 05/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//


import SpriteKit
import GameplayKit


class BalloonComponent: GKComponent {
    
    var balloon: SKSpriteNode
    
    init(parentNode: SKNode, balloonNodeName: String) {
        self.balloon = parentNode.childNode(withName: balloonNodeName) as! SKSpriteNode
        self.balloon.alpha = 0
        
        super.init()
    }
        
    func isVisible(){
        
        self.balloon.alpha = 1
        
    }
    
    func isNotVisible(){
        
        self.balloon.alpha = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
