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

//this variable will be use by observe
let pausedExit = Notification.Name(rawValue: "pausedExit")
let GameOver = Notification.Name(rawValue: "GameOver")

class GameViewController: UIViewController {
    
    var gameScene: GameScene? = nil
    let testerOrDebbuger: Bool = false
    
    @IBOutlet weak var roseProgress: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIScreen.main.brightness = 0.4
        shake()
        createScene()
        createObserve()
    }
    
    func createObserve(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.exitPaused), name: pausedExit, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.GameOverReturn), name: GameOver, object: nil)
    }
    
    @objc func exitPaused(){
        resumeGame()
    }
    
    @objc func GameOverReturn(){
        createScene()
    }
    
    func createScene(){
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
                    
                    view.ignoresSiblingOrder = testerOrDebbuger
                    view.showsPhysics = testerOrDebbuger
                    view.showsFPS = testerOrDebbuger
                    view.showsNodeCount = testerOrDebbuger
                }
                
            }
        }
    }
    
    func shake() {
        
        let center = view.center
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.2
        shake.repeatCount = .infinity
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x, y: center.y + 2)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        view.layer.add(shake, forKey: "Shake")
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
        shake()
        self.gameScene?.inPaused(switchPaused: false)
    }
    
    @IBAction func inPausedGame(_ sender: Any) {
        view.layer.removeAnimation(forKey: "Shake")
        self.gameScene?.inPaused(switchPaused: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PauseViewController") as! PauseViewController
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(vc)
        self.view.addSubview(vc.view)
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
