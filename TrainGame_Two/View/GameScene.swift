//
//  GameScene.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //#MARK: Variables
    var graphs = [String : GKGraph]()
    var entityManager: EntityManager!
    
    private var lastUpdateTime : TimeInterval = 0
    private var control: Control?
    var moveJoystickHiddenArea: TLAnalogJoystickHiddenArea? = nil
    var gameOver: Bool = false
    
    let moveJoystick = 🕹(withDiameter: 100)
    //let camera: SKCameraNode?
  
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
        hiddenJoystick.joystick?.zPosition = 4
        self.camera?.addChild(hiddenJoystick)
        
        entityManager = EntityManager(scene: self)
        
        let personagemPrincipal = Player(nodeName: "player", gameScene: self)
        let petala1 = Petala(nodeName: "nodePetal-1", gameScene: self)
        let boxBig1 = BoxObstacle(nodeName: "PhysicBoxG-1", gameScene: self)
        let soulEnemy1 = SoulEnemy(nodeName: "SoulPhysicNode-1", gameScene: self, minX: 1200, maxX: 1520)
        let hotArea1 = DangerArea(nodeName: "hotArea-1" ,gameScene: self)
        let infoArea = InfoArea(nodeName: "infoArea-1", gameScene: self)
        let jumpArea1 = JumpArea(nodeName: "jumpArea-1", gameScene: self)
        let jumpArea2 = JumpArea(nodeName: "jumpArea-2", gameScene: self)
        let jumpArea3 = JumpArea(nodeName: "jumpArea-3", gameScene: self)
//        let infoArea1 = InfoArea(nodeName: "infoArea-1", gameScene: self)
        let soundBox = SoundBox(nodeName: "NodeSoundBox-1", gameScene: self)
        
        if personagemPrincipal.component(ofType: PlayerComponent.self) != nil {
            
//            moveJoystick.on(.begin) { [unowned self] _ in }
            
            moveJoystick.on(.move) { [unowned self] joystick in
                
                guard let spriteComponent = personagemPrincipal.component(ofType: SpriteComponent.self) else {
                    return
                }
                
              
                let pVelocity = joystick.velocity;
                let speed = CGFloat(0.05)

                if self.control?.directionCommand == UserControl.jump {
                    
                    // MARK: Move for Physics
                    spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed), y: spriteComponent.nodePhysic.position.y)

                    
                } else {
                    
                    self.control?.directionCommand = self.moveJoystick.userControl
                    //Mark: Trecho do código que faz o personagem virar. OBS: FAZER O PERSONAGEM VIRADO PARA A DIREITA (PADRÃO DE PROJETO)
                    
                    if self.control?.directionCommand == UserControl.right {
                         spriteComponent.nodeTexture.xScale = abs(spriteComponent.nodeTexture.xScale) * 1.0
                        
                        
                    } else {
                        
                        spriteComponent.nodeTexture.xScale = abs(spriteComponent.nodeTexture.xScale) * -1.0
                        
                    }
                
                    // MARK: Move for Physics
                    spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed), y: spriteComponent.nodePhysic.position.y)
            
                }
                
            }
            
            moveJoystick.on(.end) { [unowned self] _ in
              
                if self.control?.directionCommand != UserControl.jump {
                    self.control?.directionCommand = UserControl.idle
                }
            }
        }
        

//        addEntities(arrayEntities: [personagemPrincipal, hotArea1, petala1, boxBig1, soulEnemy1, infoArea1, jumpArea1,jumpArea2,jumpArea3,soundBox])
        addEntities(arrayEntities: [personagemPrincipal, hotArea1, petala1, boxBig1, soulEnemy1, jumpArea1,jumpArea2,jumpArea3,soundBox])
        view.isMultipleTouchEnabled = false
    }
    
    func addEntities(arrayEntities: Array<GKEntity>) {
        for entity in arrayEntities {
            entityManager.add(entity)
        }
    }
    
     
    func didBegin(_ contact: SKPhysicsContact) {
//        print("Houve Contato😎")
        
        control?.swipeActive =  false
        
        //Verifica contato entre player e a petala
        guard let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node else {
            
            return
        }
          
        
        guard let entityA = nodeA.entity, let entityB = nodeB.entity else {
            control?.directionCommand =  UserControl.idle
            return
            
        }
        
//        print("Contato: \(entityA) com \(entityB)")
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: CollectableComponent.self) {
            
            self.entityManager.contactObjects = true
            entityB.component(ofType: BalloonComponent.self)!.isVisible()
            self.control?.collectableActive = true
            self.entityManager.setObjectInContact(entity: entityB)
            
        } else if  let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: CollectableComponent.self) {
            
            self.entityManager.contactObjects = true
            entityA.component(ofType: BalloonComponent.self)!.isVisible()
            self.control?.collectableActive = true
            self.entityManager.setObjectInContact(entity: entityA)
            
        }
        
        //Entra em contato com a caixinha de som
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: SpeakableComponent.self){
            
            self.entityManager.contactObjects = true
            entityB.component(ofType: BalloonComponent.self)!.isVisible()
            self.entityManager.setObjectInContact(entity: entityB)
            radioSound.playSoundEffect()
            self.control!.speakableActive = true
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: SpeakableComponent.self) {
           
            self.entityManager.contactObjects = true
            entityA.component(ofType: BalloonComponent.self)!.isVisible()
            self.entityManager.setObjectInContact(entity: entityA)
            radioSound.playSoundEffect()
            self.control!.speakableActive = true
            
        }
        
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: HotRegionComponent.self) {
            
            let entities = self.entityManager.getEntitys(component: EnemyComponente.self)
            entities[0].component(ofType: EnemyComponente.self)?.state = .ataque
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: HotRegionComponent.self) {
            
            let entities = self.entityManager.getEntitys(component: EnemyComponente.self)
            entities[0].component(ofType: EnemyComponente.self)?.state = .ataque
            
        }
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: EnemyComponente.self) {
            
            // FAZ ALGO INIMIGO E PLAYER
            print("inimigo e player")
            self.gameOver = true
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: EnemyComponente.self) {
            
            // FAZ ALGO INIMIGO E PLAYER
            self.gameOver = true
            print("inimigo e player")
        }
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: InfoComponent.self) {
            
            // FAZ ALGO INFO E PLAYER
//            print("information + player 1")
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: InfoComponent.self) {
            
            // FAZ ALGO INFO E PLAYER
//            print("information + player 2")
        }
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: JumpComponent.self) {
            
            // incremento do jump do player
//            print("jump + player")
            self.control?.directionCommand =  UserControl.idle
            self.control?.incrementJump = 20
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: JumpComponent.self) {
            
            // incremento do jump do player
//            print("jump + player")
            self.control?.directionCommand =  UserControl.idle
            self.control?.incrementJump = 20
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
        

//        print("DesContato: \(entityA) com \(entityB)")
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: CollectableComponent.self) {
            if (self.entityManager.contactObjects == true)
            {
                self.entityManager.entityInContact = nil
                self.entityManager.contactObjects = false
            }
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: CollectableComponent.self) {
            if (self.entityManager.contactObjects == true)
            {
                self.entityManager.entityInContact = nil
                self.entityManager.contactObjects = false
            }
        }
        
        //Entra na Area do Inimigo
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: HotRegionComponent.self) {
            
            let entities = self.entityManager.getEntitys(component: EnemyComponente.self)
            
            let entityEnemyNode = entities[0].component(ofType: SpriteComponent.self)?.nodePhysic
            
            entities[0].component(ofType: EnemyComponente.self)?.state = StateEnemy.vigilancia
            
            entities[0].component(ofType: EnemyComponente.self)?.vigiar(autor: entityEnemyNode!)
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: HotRegionComponent.self) {
            
            
            let entities = self.entityManager.getEntitys(component: EnemyComponente.self)
            
            let entityEnemyNode = entities[0].component(ofType: SpriteComponent.self)?.nodePhysic
            
            entities[0].component(ofType: EnemyComponente.self)?.state = StateEnemy.vigilancia
            
            entities[0].component(ofType: EnemyComponente.self)?.vigiar(autor: entityEnemyNode!)
            
        }
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: JumpComponent.self) {
            
            // decremento do jump do player
//            print("desjump + player")
            self.control?.incrementJump = 0
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: JumpComponent.self) {
            
            // decremento do jump do player
//            print("desjump + player")
            self.control?.incrementJump = 0
        }
        
       
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: SpeakableComponent.self) {
            if (self.entityManager.contactObjects == true)
            {
                self.entityManager.contactObjects = false
                radioSound.pauseSong()
            }
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: SpeakableComponent.self) {
            if (self.entityManager.contactObjects == true)
            {
                self.entityManager.contactObjects = false
                radioSound.pauseSong()
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
        
        if gameOver == true {
//            print("Game Over!")
            controllerScenesGame(keyScene: 1)
        }
    }
    
    
    func controllerScenesGame (keyScene: Int) {
        switch keyScene {
        case 1:
            NotificationCenter.default.post(name: GameOver, object: nil)
        default:
           print("key don't identify")
        }
    }
    
    
    func inPaused(switchPaused: Bool){
        self.view?.isPaused = switchPaused
    }
    
}
