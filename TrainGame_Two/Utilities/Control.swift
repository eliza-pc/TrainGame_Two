//
//  Control.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto

import SpriteKit
import GameplayKit


enum UserControl {
    case take
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
    var speakableActive: Bool = false
    var incrementJump: Int = 0
    var pushBox: Bool = false
    
    var countPhrases: Int = 0
    
    var feedbackGenerator: UINotificationFeedbackGenerator? = UINotificationFeedbackGenerator()
    
    init(view: UIView, gameScene: GameScene) {
        self.gameScene = gameScene
        self.addSwiperRecognizer(view: view)
        self.addLongRecognizer(view: view)
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
    
    func addLongRecognizer(view: UIView) {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleRecognize))
        longPressRecognizer.minimumPressDuration = 1
        longPressRecognizer.numberOfTouchesRequired = 1
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleRecognize))
        view.addGestureRecognizer(tapGestureRecognizer)
        view.addGestureRecognizer(longPressRecognizer)
    }
    
    
    
    @objc func handleRecognize(gesture: UIGestureRecognizer){
        if let gesture = gesture as? UISwipeGestureRecognizer {

            switch gesture.direction{
            case .up:

                if directionCommand != UserControl.jump && swipeActive == false  {
   
                    directionCommand = UserControl.jump
                    swipeActive = true
                    jump()
                }

            case .down:
                directionCommand = UserControl.take
            default:
                print("don't have swipe")
               
            }
            
        }
        
        if gesture is UITapGestureRecognizer {
            if speakableActive == true {
                
                print("Fazer dinamica, qtd de tap: ", countPhrases)
                
                countPhrases += 1
                
                
            }
//            else if pushBox == true { }
        }
        
        if gesture is UILongPressGestureRecognizer {
            if collectableActive == true {
                self.feedbackGenerator?.notificationOccurred(.success)
                if let removeObject = self.gameScene.entityManager.getObjectInContact() {
                    self.gameScene.entityManager.remove(removeObject)
                    self.collectableActive = false
                }
            }
            //            else if pushBox == true { }
        }
        
        
    }
    
    func jump() {
        //Mark: Control Entities
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        self.entityNode = entitys[0].component(ofType: SpriteComponent.self)?.nodePhysic
        entityNode?.run(SKAction.moveTo(y: CGFloat(8 + incrementJump), duration: 0.35))
        
    }
    
    func updatePressedButtons(control: UserControl?, dt: Double) {
        
        if (control == UserControl.jump) {
        
            stateJump()
            
        }else if (control == UserControl.take) {
       
            
        }else if (control == UserControl.left) {
           
            stateWalk()
            
        }else if (control == UserControl.right) {
            
            stateWalk()
            
            
        }else if (control == UserControl.idle){
          
            stateIdle()
        }
        
        
        
    }
    
    func stateIdle(){
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        let entity = entitys[0]
        guard let state = entity.component(ofType: StateMachineComponent.self) else{
            return
        }
        state.stateMachine.enter(IdleState.self)
    }
    func stateWalk(){
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        let entity = entitys[0]
        guard let state = entity.component(ofType: StateMachineComponent.self) else{
            return
        }
        state.stateMachine.enter(WalkState.self)
    }
    func stateJump(){
        let entitys = gameScene.entityManager.getEntitys(component: PlayerComponent.self)
        let entity = entitys[0]
        guard let state = entity.component(ofType: StateMachineComponent.self) else{
            return
        }
        state.stateMachine.enter(JumpState.self)
    }
    
}

