//
//  StateMachineComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto


import GameplayKit
import SpriteKit

class AnimatedState: GKState{
   
    fileprivate weak var component: StateMachineComponent?
    
    init(_ component: StateMachineComponent){
        self.component = component
        super.init()
    }
    
    
    func activateNode(_ node: SKSpriteNode){
        
    }
    func deactivateNode(_ node: SKSpriteNode){
        
    }
    
    override func didEnter(from previousState: GKState?) {
        guard let node = component?.entity?.component(ofType:  SpriteComponent.self)?.nodeTexture else {
                return
        }
        activateNode(node)
    }
    
    override func willExit(to nextState: GKState) {
        guard let node = component?.entity?.component(ofType: SpriteComponent.self)?.nodeTexture else {
            return
        }
        deactivateNode(node)
    }
    
}

class IdleState: AnimatedState{
    private let action = SKAction.repeatForever(SKAction.animate(with: .init(withFormat: "normal-%d", range: 1...10), timePerFrame: 0.3))
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is WalkState.Type || stateClass is JumpState.Type
    }
    
    override func activateNode(_ node: SKSpriteNode) {
        node.run(action, withKey: "normal")
       
        
    }
    override func deactivateNode(_ node: SKSpriteNode) {
        node.removeAction(forKey: "normal")
       // SoundEffects.soundEffects.playSoundEffect(sound: "breathe")
    }
    
}

class WalkState: AnimatedState{
    
    private let action = SKAction.repeatForever(SKAction.animate(with: .init(withFormat: "walk%d", range: 1...10), timePerFrame: 0.1))
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is IdleState.Type || stateClass is JumpState.Type
    }
    
    override func activateNode(_ node: SKSpriteNode) {
        node.run(action, withKey: "walk")
            //SoundEffects.soundEffects.playSoundEffect(sound: "walk3")
        walkSound.playSoundEffect()
       
    }
    override func deactivateNode(_ node: SKSpriteNode) {
        node.removeAction(forKey: "walk")
        walkSound.pauseSong()
    
    }
    
}

class JumpState: AnimatedState{
    private let action = SKAction.repeatForever(SKAction.animate(with: .init(withFormat: "jump%d", range: 1...10), timePerFrame: 0.1))
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is IdleState.Type || stateClass is IdleState.Type || stateClass is WalkState.Type
    }
    
    override func activateNode(_ node: SKSpriteNode) {
        node.run(action, withKey: "jump")
        
    }
    override func deactivateNode(_ node: SKSpriteNode) {
        node.removeAction(forKey: "jump")
       // SoundEffects.soundEffects.playSoundEffect(sound: "jump")
        jumpSound.playSoundEffect()
        
    }
    
}

class StateMachineComponent: GKComponent {
    
    private(set) var stateMachine: GKStateMachine!
    
    override init() {
        super.init()
        self.stateMachine = GKStateMachine(states: [
            IdleState(self),
            WalkState(self),
            JumpState(self),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

