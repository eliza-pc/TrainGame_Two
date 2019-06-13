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

let arrayEnigmas: [SKTexture] = [SKTexture.init(imageNamed: "Ballon"),SKTexture.init(imageNamed: "Ballon3"),SKTexture.init(imageNamed: "Ballon2")]


class BalloonComponent: GKComponent {
    
    var balloon: SKSpriteNode
    
    init(parentNode: SKNode, balloonNodeName: String) {
        self.balloon = parentNode.childNode(withName: balloonNodeName) as! SKSpriteNode
        
        switch parentNode.name {
        case "NodeSoundBox-1":
            self.balloon.size = CGSize(width: 588, height: 213)
            self.balloon.position = CGPoint(x: -30, y: 20)
            self.balloon.texture = arrayEnigmas[1]
        case "NodeSoundBox-2":
//            self.balloon.position = CGPoint(x: -220, y: 20)
            self.balloon.position = CGPoint(x: -20, y: 60)
            self.balloon.size = CGSize(width: 588, height: 213)
            self.balloon.texture = arrayEnigmas[2]
        default:
            print("erro, don't identify Node")
        }
    
        
    //    self.balloon.texture = arrayEnigmas[0]
        self.balloon.alpha = 0
        
        super.init()
    }
        
    func isVisible(){
        self.balloon.alpha = 1
    }
    func isNotVisible(){
        self.balloon.alpha = 0
    }
    
    
    func changeBallon(index: Int) {
        switch index {
        case 1:
        
            self.balloon.size = CGSize(width: 588, height: 213)
            self.balloon.position = CGPoint(x: -30, y: 20)
            self.balloon.texture = arrayEnigmas[index]
         
        case 2:
            
            self.balloon.size = CGSize(width: 588, height: 213)
            self.balloon.texture = arrayEnigmas[index]
            
        default:
            print("don't have index")
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
