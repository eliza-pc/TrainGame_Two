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
    let speedIncremento: CGFloat = 0.8
    var speedJump: CGFloat = 0
    
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
//        let boxBig2 = BoxObstacle(nodeName: "PhysicsBoxG-2", gameScene: self)
        let soulEnemy1 = SoulEnemy(nodeName: "SoulPhysicNode-1", gameScene: self,minX: 560, maxX: 800)
//        let soulEnemy2 = SoulEnemy(nodeName: "SoulPhysicNode-2", gameScene: self,minX: 640, maxX: 720)
        let hotArea1 = DangerArea(nodeName: "hotArea-1" ,gameScene: self)
        let jumpArea1 = JumpArea(nodeName: "jumpArea-1", gameScene: self)
//        let jumpArea2 = JumpArea(nodeName: "jumpArea-2", gameScene: self)
        let infoArea1 = InfoArea(nodeName: "infoArea-1", gameScene: self)
        let soundBox = SoundBox(nodeName: "NodeSoundBox-1", gameScene: self)
        let soundBox2 = SoundBox(nodeName: "NodeSoundBox-2", gameScene: self)
        
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
                    spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed) + self.speedJump, y: spriteComponent.nodePhysic.position.y)

                    
                } else {
                    
                    self.control?.directionCommand = self.moveJoystick.userControl
                    //Mark: Trecho do código que faz o personagem virar. OBS: FAZER O PERSONAGEM VIRADO PARA A DIREITA (PADRÃO DE PROJETO)
                    
                    if self.control?.directionCommand == UserControl.right {
                         spriteComponent.nodeTexture.xScale = abs(spriteComponent.nodeTexture.xScale) * 1.0
                        
                        if self.moveJoystick.handle.position.x > 0 {
                            spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed) + self.speedJump, y: spriteComponent.nodePhysic.position.y)
                        } else {
                            // MARK: Move for Physics
                            spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed), y: spriteComponent.nodePhysic.position.y)
                        }
                        
                        
                    } else {
                        
                        spriteComponent.nodeTexture.xScale = abs(spriteComponent.nodeTexture.xScale) * -1.0
                        
                        if self.moveJoystick.handle.position.x > 0 {
                            // MARK: Move for Physics
                            spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed) - self.speedJump, y: spriteComponent.nodePhysic.position.y)
                        } else {
                            
                            // MARK: Move for Physics
                            spriteComponent.nodePhysic.position = CGPoint(x: spriteComponent.nodePhysic.position.x + (pVelocity.x * speed), y: spriteComponent.nodePhysic.position.y)
                        }
                
                    }
                
                }
                
            }
            
            moveJoystick.on(.end) { [unowned self] _ in
              
                if self.control?.directionCommand != UserControl.jump {
                    self.control?.directionCommand = UserControl.idle
                }
            }
        }
        

        addEntities(arrayEntities: [personagemPrincipal, hotArea1, petala1, boxBig1, soulEnemy1, infoArea1, jumpArea1,soundBox, soundBox2])
//        addEntities(arrayEntities: [personagemPrincipal, hotArea1, petala1, boxBig1,boxBig2, soulEnemy1,soulEnemy2,infoArea,jumpArea1,jumpArea2,jumpArea1,soundBox])
        view.isMultipleTouchEnabled = false
    }
    
    func addEntities(arrayEntities: Array<GKEntity>) {
        for entity in arrayEntities {
            entityManager.add(entity)
        }
    }
    
    
    func foundEntityWithNodeName(entities: [GKEntity], nodeName: String) -> GKEntity? {
        
        var entityFound: GKEntity? = nil
        var count: Int = 0
        for entity in entities {
            count = count + 1
            
//            print("\(count) - NodeName: \(nodeName), nodePhysicBodyName: \(entity.component(ofType: SpriteComponent.self)?.nodePhysic.name) ")
            
            if entity.component(ofType: SpriteComponent.self)?.nodePhysic.name == nodeName {
                
                entityFound = entity
            }
        }
        
        return entityFound
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











extension GameScene {
    
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
//            entityB.component(ofType: BalloonComponent.self)!.isVisible()
            self.control?.collectableActive = true
            self.entityManager.setObjectInContact(entity: entityB)
            
        } else if  let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: CollectableComponent.self) {
            
            self.entityManager.contactObjects = true
//            entityB.component(ofType: BalloonComponent.self)!.isVisible()
            self.control?.collectableActive = true
            self.entityManager.setObjectInContact(entity: entityA)
            
        }
        
        //Entra em contato com a caixinha de som
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: SpeakableComponent.self){
            
            self.entityManager.contactObjects = true
            entityB.component(ofType: BalloonComponent.self)!.isVisible()
            self.entityManager.setObjectInContact(entity: entityB)
            radioSound.playSoundEffect()
            entityB.component(ofType: SoundComponent.self)?.soundVisible()
            //  self.control!.speakableActive = true
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: SpeakableComponent.self) {
            
            self.entityManager.contactObjects = true
            entityA.component(ofType: BalloonComponent.self)!.isVisible()
            self.entityManager.setObjectInContact(entity: entityA)
            radioSound.playSoundEffect()
            entityA.component(ofType: SoundComponent.self)?.soundVisible()
            //  self.control!.speakableActive = true
            
        }
        
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: HotRegionComponent.self) {
            let nodeName: String = "SoulPhysicNode-1"
            let entities = self.entityManager.getEntitys(component: EnemyComponente.self)
            let entityEnem = self.foundEntityWithNodeName(entities: entities, nodeName: nodeName)
            entityEnem?.component(ofType: EnemyComponente.self)?.state = .ataque
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: HotRegionComponent.self) {
            
            let nodeName: String = "SoulPhysicNode-1"
            let entities = self.entityManager.getEntitys(component: EnemyComponente.self)
            let entityEnem = self.foundEntityWithNodeName(entities: entities, nodeName: nodeName)
            entityEnem?.component(ofType: EnemyComponente.self)?.state = .ataque
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
        
        //O player entra em contato com essa area e o radinho ativa
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: InfoComponent.self) {
            
            let entities = self.entityManager.getEntitys(component: SpeakableComponent.self)
            self.entityManager.contactObjects = true
            
            let entitySound = self.foundEntityWithNodeName(entities: entities, nodeName: "NodeSoundBox-1")
            
            entitySound?.component(ofType: BalloonComponent.self)!.isVisible()
            self.entityManager.setObjectInContact(entity: entitySound!)
            radioSound.playSoundEffect()
            entitySound?.component(ofType: SoundComponent.self)?.soundVisible()
            self.control!.speakableActive = true
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: InfoComponent.self) {
            
            let entities = self.entityManager.getEntitys(component: SpeakableComponent.self)
            
            self.entityManager.contactObjects = true
            
            let entitySound = self.foundEntityWithNodeName(entities: entities, nodeName: "NodeSoundBox-1")
            entitySound?.component(ofType: BalloonComponent.self)!.isVisible()
            self.entityManager.setObjectInContact(entity: entitySound!)
            radioSound.playSoundEffect()
            entitySound?.component(ofType: SoundComponent.self)?.soundVisible()
            self.control!.speakableActive = true
            
        }
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: JumpComponent.self) {
            
            // incremento do jump do player
            //            print("jump + player")
            self.control?.directionCommand =  UserControl.idle
            self.control?.incrementJump = 30
            self.speedJump = speedIncremento
            self.control?.isOntheBox = true
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: JumpComponent.self) {
            
            // incremento do jump do player
            //            print("jump + player")
            self.control?.directionCommand =  UserControl.idle
            self.control?.incrementJump = 30
            self.speedJump = speedIncremento
            self.control?.isOntheBox = true
        }
        
        
    }
    
    //#MARK: Função didEnd
    func didEnd(_ contact: SKPhysicsContact) {
        
        //Verifica contato entre player e a petala
        guard let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node else {
            return
        }
        guard let entityA = nodeA.entity, let entityB = nodeB.entity else {
            return
        }
        
        
        //Parar o contato com a petala
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
        
        
        //Sair da area de Perigo
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: HotRegionComponent.self) {
            let entities = self.entityManager.getEntitys(component: EnemyComponente.self)
            let entityEnem = foundEntityWithNodeName(entities: entities, nodeName: "SoulPhysicNode-1")
            let entityEnemyNode = entityEnem?.component(ofType: SpriteComponent.self)?.nodePhysic
           
            entityEnem?.component(ofType: EnemyComponente.self)?.state = StateEnemy.vigilancia
            entityEnem?.component(ofType: EnemyComponente.self)?.vigiar(autor: entityEnemyNode!)
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: HotRegionComponent.self) {
            let entities = self.entityManager.getEntitys(component: EnemyComponente.self)
            let entityEnem = foundEntityWithNodeName(entities: entities, nodeName: "SoulPhysicNode-1")
            
            let entityEnemyNode = entityEnem?.component(ofType: SpriteComponent.self)?.nodePhysic
          
            entityEnem?.component(ofType: EnemyComponente.self)?.state = StateEnemy.vigilancia
            entityEnem?.component(ofType: EnemyComponente.self)?.vigiar(autor: entityEnemyNode!)
        }
        
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: JumpComponent.self) {
            
            self.control?.incrementJump = 0
            self.control?.isOntheBox = false
            self.speedJump = 0
            
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: JumpComponent.self) {
            
            self.control?.incrementJump = 0
            self.control?.isOntheBox = false
            self.speedJump = 0
        }
        
        
        //Parar o contato da InfoArea com o Player
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: InfoComponent.self) {
            
            if (self.entityManager.contactObjects == true){
                self.entityManager.contactObjects = false
                let entities = self.entityManager.getEntitys(component: SoundComponent.self)
                let entitySound = foundEntityWithNodeName(entities: entities, nodeName: "NodeSoundBox-1")
                entitySound?.component(ofType: SoundComponent.self)?.dontVisible()
                
                radioSound.pauseSong()
                
            }
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: InfoComponent.self) {
            
            if (self.entityManager.contactObjects == true){
                self.entityManager.contactObjects = false
                let entities = self.entityManager.getEntitys(component: SoundComponent.self)
                let entitySound = foundEntityWithNodeName(entities: entities, nodeName: "NodeSoundBox-1")
                entitySound?.component(ofType: SoundComponent.self)?.dontVisible()
                radioSound.pauseSong()
            }
        }
        
        
        if let _ = entityA.component(ofType: PlayerComponent.self), let _ = entityB.component(ofType: SpeakableComponent.self) {
            if (self.entityManager.contactObjects == true){
                self.entityManager.contactObjects = false
                radioSound.pauseSong()
                entityB.component(ofType: SoundComponent.self)?.dontVisible()
            }
        } else if let _ = entityB.component(ofType: PlayerComponent.self), let _ = entityA.component(ofType: SpeakableComponent.self) {
            if (self.entityManager.contactObjects == true)
            {
                self.entityManager.contactObjects = false
                radioSound.pauseSong()
                entityA.component(ofType: SoundComponent.self)?.dontVisible()
            }
        }
        
        
    }

    
}
