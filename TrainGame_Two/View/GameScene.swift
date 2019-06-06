//
//  GameScene.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho on 21/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //#MARK: Variables
    var graphs = [String : GKGraph]()
    var entityManager: EntityManager!
    
    private var lastUpdateTime : TimeInterval = 0
    private var control: Control?
    var moveJoystickHiddenArea: TLAnalogJoystickHiddenArea? = nil
    
    let setJoystickStickImageBtn = SKLabelNode()
    let setJoystickSubstrateImageBtn = SKLabelNode()
    let joystickStickColorBtn = SKLabelNode(text: "Sticks random color")
    let joystickSubstrateColorBtn = SKLabelNode(text: "Substrates random color")
    
    let moveJoystick = 🕹(withDiameter: 100)
    let rotateJoystick = TLAnalogJoystick(withDiameter: 100)
    var joystickStickImageEnabled = true
    var joystickSubstrateImageEnabled = true
    
    
    var player: SKSpriteNode?
    var Souls: SKAudioNode?
 
    
    
    //#MARK: DidMove_FUNC
    override func didMove(to view: SKView) {
        
        
        control = Control(view: self.view!, gameScene: self)
        
        //Para add physicsbody
        physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -3.5)
        moveJoystickHiddenArea = TLAnalogJoystickHiddenArea(rect: CGRect(x: -(frame.width/2), y:  -(frame.height/2), width: frame.width, height: frame.height))

        guard let hiddenJoystick = self.moveJoystickHiddenArea else {return}
        
        hiddenJoystick.joystick = moveJoystick
        moveJoystick.isMoveable = true
        self.camera?.addChild(hiddenJoystick)
        
        entityManager = EntityManager(scene: self)
        
        let personagemPrincipal = Player(imageName: "idle1", gameScene: self)
        let petala = Petala(imageName: "RosePetal", gameScene: self)
        let boxBig = BoxObstacle(imageName: "Luggage", gameScene: self)
        
        if personagemPrincipal.component(ofType: PlayerComponent.self) != nil {
            
            moveJoystick.on(.begin) { [unowned self] _ in
             
//                self.control?.directionCommand = UserControl.idle
                
              //  let actions = [
//                    SKAction.scale(to: 1, duration: 0.5),
//                    SKAction.scale(to: 1, duration: 0.5)
                    
//                    SKAction.scale(to: 1, duration: 0.5),
//                    SKAction.scale(to: 1, duration: 0.5)

               // ]
                
               // spriteComponent.node.run(SKAction.sequence(actions))
            }
            
            moveJoystick.on(.move) { [unowned self] joystick in
                
                guard let spriteComponent = personagemPrincipal.component(ofType: SpriteComponent.self) else {
                    return
                }
                
                
                
//                print (self.moveJoystick)
                let pVelocity = joystick.velocity;
                let speed = CGFloat(0.05)

                if self.control?.directionCommand == UserControl.jump {
                    // MARK: Move for Physics
                    spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed), y: spriteComponent.nodePhysic.position.y)
// + (100 * speed)
                //    print(self.control?.directionCommand ?? "")
                    if self.control?.directionCommand == UserControl.right {
                        spriteComponent.nodeTexture.xScale = abs(spriteComponent.nodeTexture.xScale) * 1.0
                        
                        
                        
                    } else {
                        
                        spriteComponent.nodeTexture.xScale = abs(spriteComponent.nodeTexture.xScale) * -1.0
                        
                        
                    }
                    
                } else {
                    
                    self.control?.directionCommand = self.moveJoystick.userControl
                    //Mark: Trecho do código que faz o personagem virar. OBS: FAZER O PERSONAGEM VIRADO PARA A DIREITA (PADRÃO DE PROJETO)
                    
                    if self.control?.directionCommand == UserControl.right {
                         spriteComponent.nodeTexture.xScale = abs(spriteComponent.nodeTexture.xScale) * 1.0
                        
                      
                        
                    } else {
                        
                        spriteComponent.nodeTexture.xScale = abs(spriteComponent.nodeTexture.xScale) * -1.0
                   
                        
                    }
                //    print(self.control?.directionCommand ?? "")
                    // MARK: Move for Physics
                    spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed), y: spriteComponent.nodePhysic.position.y)
            
                }
                
            }
            
            moveJoystick.on(.end) { [unowned self] _ in
              //  print("ta acabando")
//                let actions = [
//                    SKAction.scale(to: 1, duration: 0.5),
//                    SKAction.scale(to: 1, duration: 0.5)
//                ]
//
//                spriteComponent.node.run(SKAction.sequence(actions))
                if self.control?.directionCommand != UserControl.jump {
                    self.control?.directionCommand = UserControl.idle
                }
            }
        }
        
        entityManager.add(personagemPrincipal)
        entityManager.add(petala)
        entityManager.add(boxBig)
        view.isMultipleTouchEnabled = false
        
    }
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("Houve Contato😎")
        
 //       let petala = Petala(imageName: "RosePetal", gameScene: self)

        control?.directionCommand =  UserControl.idle
        control?.swipeActive =  false
        
        //Verifica contato entre player e a petala
        guard let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node else {
            
            return
        }
        
        
        guard let entityA = nodeA.entity, let entityB = nodeB.entity else {
            
            return
        }
        
        print("Contato: \(entityA) com \(entityB)")
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: CollectableComponent.self) {
            
            self.entityManager.contactObjects = true
            entityB.component(ofType: BalloonComponent.self)!.isVisible()
            self.control?.collectableActive = true
            self.entityManager.setObjectInContact(entity: entityB)
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: CollectableComponent.self) {
            
            self.entityManager.contactObjects = true
            entityA.component(ofType: BalloonComponent.self)!.isVisible()
            self.control?.collectableActive = true
            self.entityManager.setObjectInContact(entity: entityA)
            
        } else {
            
            return
            
        }

    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
        //Verifica contato entre player e a petala
        guard let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node else {
            
            return
        }
        
        
        guard let entityA = nodeA.entity, let entityB = nodeB.entity else {
            
            return
        }
        
        print("DesContato: \(entityA) com \(entityB)")
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: CollectableComponent.self) {
            if (self.entityManager.contactObjects == true)
            {
                self.entityManager.contactObjects = false
            }
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: CollectableComponent.self) {
            if (self.entityManager.contactObjects == true)
            {
                self.entityManager.contactObjects = false
            }
        } else { return }
        
    }
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        // Instanciar os objetos
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
    
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        
        //get entity para update da control e moving component

        control?.updatePressedButtons(control: self.control?.directionCommand, dt: dt)
        
        entityManager.update(dt: dt)
        
        self.lastUpdateTime = currentTime
        
       
    }
    
    
    
    
}
