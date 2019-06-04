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
    var parallaxComponentSystem: GKComponentSystem<ParallaxComponent>?
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
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
    
    //#MARK: DidMove_FUNC
    override func didMove(to view: SKView) {
        
        let personagemPrincipal = Player(imageName: "idle1", gameScene: self)
        
        control = Control(view: self.view!, gameScene: self)
        
        //Para add physicsbody
        physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        moveJoystickHiddenArea = TLAnalogJoystickHiddenArea(rect: CGRect(x: -(frame.width/2), y:  -(frame.height/2), width: frame.width, height: frame.height))

        guard let hiddenJoystick = self.moveJoystickHiddenArea else {return}
        
        hiddenJoystick.joystick = moveJoystick
        moveJoystick.isMoveable = true
        self.camera?.addChild(hiddenJoystick)
        
        entityManager = EntityManager(scene: self)
        
        let personagemPrincipal = Player(imageName: "idle1", gameScene: self)
        let petala = Petala(imageName: "RosePetal", gameScene: self)
      
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
                let speed = CGFloat(0.12)

                if self.control?.directionCommand == UserControl.jump {
                    // MARK: Move for Physics
                    spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed), y: spriteComponent.nodePhysic.position.y)
// + (100 * speed)
                //    print(self.control?.directionCommand ?? "")
                    
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
        view.isMultipleTouchEnabled = false
        
        for entity in self.entityManager.entities {
            parallaxComponentSystem?.addComponent(foundIn: entity)
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("Houve Contato😎")
        
        let petala = Petala(imageName: "RosePetal", gameScene: self)

        control?.directionCommand =  UserControl.idle
        control?.swipeActive =  false
        
        //Verifica contato entre player e a petala
        guard let nodePetala = contact.bodyA.node, let nodePlayer = contact.bodyB.node else {
            return
        }
        guard let entityOfPlayer = nodePetala.entity, let entityOfPetal = nodePlayer.entity else {
            return
        }
        
        print("Contato: \(entityOfPlayer) com \(entityOfPetal)")
        
        if let _ = entityOfPlayer.component(ofType: PlayerComponent.self), let _ = entityOfPetal.component(ofType: CollectableComponent.self) {
           print("faz alguma coisa!")
        }
        
        //Remove entidade da petala da cena
        if let _ = entityOfPlayer.component(ofType: DestroyOnContactComponent.self) {
            if let index = self.entityManager.entities.firstIndex(of: entityOfPetal) {
                self.entityManager.entities.remove(at: index)
            }
        }
    

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
