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
    var swipeActive: Bool = false
    
    init(view: UIView, gameScene: GameScene){
        self.gameScene = gameScene
        addSwiperRecognizer(view: view)
        addTapRecognizer(view: view)
    }
    
    //Mark: Gestures of the User
    
    func addSwiperRecognizer(view: UIView) {
        let gesturesDirections: [UISwipeGestureRecognizer.Direction] = [.up,.down]
        for gesturesDirection in gesturesDirections {
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleRecognize))
            gestureRecognizer.direction = gesturesDirection
            gestureRecognizer.numberOfTouchesRequired = 1
            view.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    func addTapRecognizer(view: UIView) {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleRecognize))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    
    
    @objc func handleRecognize(gesture: UIGestureRecognizer){
        if let gesture = gesture as? UISwipeGestureRecognizer {

            switch gesture.direction{
            case .up:
//                print(swipeActive)
                if directionCommand != UserControl.jump && swipeActive == false  {
           //         print("swipe")
                    directionCommand = UserControl.jump
                    swipeActive = true
                    jump()
                }
//                print(directionCommand)
            case .down:
                directionCommand = UserControl.down
            default:
                print("don't have swipe")
                
            }
            
        }
        
        if let gesture = gesture as? UITapGestureRecognizer {
            print("TapOK")
        }
    }
    
    func jump() {
        //Mark: Control Entities
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        self.entityNode = entitys[0].component(ofType: SpriteComponent.self)?.node
        entityNode?.run(SKAction.moveTo(y: 20, duration: 0.25))
        
        //                    entityNode?.run(SKAction.moveTo(y: entityNode!.position.y + (100 * 1.2), duration: 0.25))
        
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

