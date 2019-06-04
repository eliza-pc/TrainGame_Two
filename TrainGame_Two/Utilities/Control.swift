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
    var collectableActive: Bool = false
    
    init(view: UIView, gameScene: GameScene){
        self.gameScene = gameScene
        self.addSwiperRecognizer(view: view)
        self.addTapRecognizer(view: view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        if gesture is UITapGestureRecognizer {
            if collectableActive == true {
                print("TapOK")
            }
        }
    }
    
    func jump() {
        //Mark: Control Entities
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        self.entityNode = entitys[0].component(ofType: SpriteComponent.self)?.nodePhysic
        entityNode?.run(SKAction.moveTo(y: 20, duration: 0.25))
        
        //                    entityNode?.run(SKAction.moveTo(y: entityNode!.position.y + (100 * 1.2), duration: 0.25))
        
    }
    
        func updatePressedButtons(control: UserControl?, dt: Double) {
    
            if (control == UserControl.jump) {

                print("upent")
                stateJump()
        
            }else if (control == UserControl.down) {
                
                print("downent")
                
            }else if (control == UserControl.left) {
                
                print("leftent")
                stateWalk()
                
            }else if (control == UserControl.right) {
                
                print("rigthent")
                stateWalk()
               
                
            }else if (control == UserControl.idle){
                stateIdle()
            }
                
            
    
        }
    func stateIdle(){
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        let entity = entitys[0]
        guard let state = entity.component(ofType: StateMachineComponent.self) else{
            print("idlo")
            return
        }
        state.stateMachine.enter(IdleState.self)
    }
    func stateWalk(){
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        let entity = entitys[0]
        guard let state = entity.component(ofType: StateMachineComponent.self) else{
            print("walko")
            return
        }
        state.stateMachine.enter(WalkState.self)
    }
    func stateJump(){
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        let entity = entitys[0]
        guard let state = entity.component(ofType: StateMachineComponent.self) else{
            print("jumpo")
            return
        }
        state.stateMachine.enter(JumpState.self)
    }
    
}

