//
//  MoveCharacterComponet.swift
//  TrainGame_Two
//
//  Created by Lucídio Andrade Barbosa de Souza on 29/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import GameplayKit


fileprivate protocol OnGround { }


fileprivate protocol CanControlHorizontalMovement { }

/**
 Represents the visuals and physics of a character that can (potentially) stand still, run left or right, jump, fall, attack, and die.
 */
class MovingCharacterComponent: GKComponent {
    enum InitialState {
        case idle
    }
    
    enum AnimationAction {
        case idle
        case preJump
        case jump
        case walk
        case die
    }
    
    enum Direction {
        case left
        case right
        
        var opposite: Direction {
            switch self {
            case .left:
                return .right
            case .right:
                return .left
            }
        }
    }
    
    private class IdleState: GKState, OnGround, CanControlHorizontalMovement {
        override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is WalkingState.Type || stateClass is PreJumpingState.Type || stateClass is DyingState.Type
        }
    }
    
    private class PreJumpingState: GKState, OnGround, CanControlHorizontalMovement {
        override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is JumpingState.Type || stateClass is DyingState.Type
        }
    }
    
    private class WalkingState: GKState, OnGround, CanControlHorizontalMovement {
        override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is IdleState.Type || stateClass is PreJumpingState.Type
        }
    }
    
    private class JumpingState: GKState, CanControlHorizontalMovement {
        override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is IdleState.Type
        }
    }
    
    private class DyingState: GKState {
        override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return false
        }
    }

}
