//
//  GameViewController.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto


import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var gameScene: GameScene? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                gameScene = sceneNode
                // Copy gameplay related content over to the scene
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    view.showsPhysics = false
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
                
               
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    
    func resumeGame(){
        self.gameScene?.inPaused(switchPaused: false)
    }
    
    @IBAction func inPausedGame(_ sender: Any) {
        
        self.gameScene?.inPaused(switchPaused: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PauseViewController") as! PauseViewController
        vc.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        self.addChild(vc)
        self.view.addSubview(vc.view)
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
