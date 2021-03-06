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
    
    init(view: UIView){
        
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
                print("up")
            case .down:
                directionCommand = UserControl.down
                print("down")
            default:
                print("don't have swipe")
                
            }
            
        }
    }
    
    
    
    // Controlls in game
    
    func touchBegan(_ touch: UITouch, in scene: SKScene) {
        
    }
    
    func touchMoved(_ touch: UITouch, in scene: SKScene) {
        
    }
    
    func touchEnded(_ touch: UITouch, in scene: SKScene) {
        
    }
    
    func touchCancelled(_ touch: UITouch, in scene: SKScene) {
        
    }
    
    
}

