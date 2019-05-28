//
//  CameraComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 27/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

//import Foundation
//import GameplayKit
//
//
//class CameraComponent: GKComponent {
//
//    let cam: SKCameraNode
//
//    init(scene: SKScene){
//
//        cam = (scene.childNode(withName: "camera") as? SKCameraNode)!
//        cam.position = CGPoint.init(x: 0, y: 0)
//        scene.camera = cam
//        super.init()
//
//    }
//
//    func followPlayer (player: SKSpriteNode) {
//        //print("\(player.position)")
//        cam.position = player.position
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}

import Foundation
import GameKit

class CameraComponent: GKComponent{
    
    private var camera : SKCameraNode
    private let parentNode : SKNode
    
    init(parentNode: SKNode) {
        
        self.camera = SKCameraNode()
        self.parentNode = parentNode
        
        camera.position = CGPoint(x: 0, y: 0)
        
        super.init()
        
    }
    
    override func didAddToEntity() {
        guard let entity = self.entity else { return }
        
        guard let nodeComponent = entity.component(ofType: SpriteComponent.self) else{ return }
        
        let node = nodeComponent.node
        
        let followConstraint = SKConstraint.distance(SKRange.init(upperLimit: 100), to: node)
        let fixedXConstraint = SKConstraint.positionX(SKRange.init(lowerLimit: 10))
       
//        let fixedYConstraint = SKConstraint.positionX(SKRange.init(lowerLimit: 0))
        
        camera.constraints = [followConstraint, fixedXConstraint]
        
        guard let cena = parentNode as? SKScene else { return }
 
        
        cena.camera = camera
        if let gameScene = cena as? GameScene {
            gameScene.moveJoystickHiddenArea?.removeFromParent()
            guard let joystick = gameScene.moveJoystickHiddenArea else {return}
            camera.addChild(joystick)
        }
        
        parentNode.addChild(camera)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
