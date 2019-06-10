//
//  BallonComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto


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
