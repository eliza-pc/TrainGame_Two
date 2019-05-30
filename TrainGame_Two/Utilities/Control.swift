//
//  Control.swift
//  TrainGame
//
//  Created by Robson James Junior on 22/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit


enum UserControl {
    case down
    case left
    case right
    case jump
    case idle
    
}


class Control {
    
    private var touchInitialLocation: CGPoint?
    var directionCommand: UserControl?
    var gameScene: GameScene
    var entityNode: SKNode? = nil
    
    init(view: UIView, gameScene: GameScene){
        self.gameScene = gameScene
        addSwiperRecognizer(view: view)
    }
    
    //Mark: Gestures of the User
    
    func addSwiperRecognizer(view: UIView) {
        let gesturesDirections: [UISwipeGestureRecognizer.Direction] = [.up,.down]
        for gesturesDirection in gesturesDirections {
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gestureRecognizer.direction = gesturesDirection
            view.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    @objc func handleSwipe(gesture: UIGestureRecognizer){
        if let gesture = gesture as? UISwipeGestureRecognizer {
            switch gesture.direction{
            case .up:
                 directionCommand = UserControl.jump 
                let entitys = gameScene.entityManager.getEntitys(component: SpriteComponent.self)
                self.entityNode = entitys[0].component(ofType: SpriteComponent.self)?.node
                entityNode?.run(SKAction.moveTo(y: entityNode!.position.y + (100 * 1.2), duration: 0.25))
            case .down:
                directionCommand = UserControl.down
            default:
                print("don't have swipe")
                
            }
            
        }
    }
    
    
    
    // Controlls in game
    
    func touchBegan(_ touch: UITouch, in scene: SKScene) {
        print("pegouSWPBG")
    }
    
    func touchMoved(_ touch: UITouch, in scene: SKScene) {
        print("pegouSWPMOVE")
    }
    
    func touchEnded(_ touch: UITouch, in scene: SKScene) {
        print("pegouSWPENDED")
    }
    
    func touchCancelled(_ touch: UITouch, in scene: SKScene) {
        print("pegouSWPCANCEL")
    }
    
    
}

