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
        let fixedYConstraint = SKConstraint.positionY(SKRange.init(upperLimit: 0))
        let lowerYConstraint = SKConstraint.positionY(SKRange.init(lowerLimit: 0))
        
        camera.constraints = [followConstraint, fixedXConstraint, fixedYConstraint, lowerYConstraint]
        
        guard let cena = parentNode as? SKScene else { return }
 
        cena.camera = camera
//        cena.camera!.position.y = node.position.y + 10
        
        
        if let gameScene = cena as? GameScene {
            gameScene.moveJoystickHiddenArea?.removeFromParent()
            guard let joystick = gameScene.moveJoystickHiddenArea else {return}
            camera.addChild(joystick)
            gameScene.moveJoystickHiddenArea?.zPosition = 4
        }
        
        parentNode.addChild(camera)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
