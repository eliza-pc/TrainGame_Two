//
//  PauseViewController.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto

import UIKit


class PauseViewController: UIViewController {
    
    @IBOutlet weak var phraseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  gameOverMorreu == true {
            let font2 = UIFont(name: "Hustle Hardcore", size: 72)
            phraseLabel.font = font2
            phraseLabel.text = "Game Over"
        } else {
            if controladorSaiuDoJogo == true {
            
                let font1 = UIFont(name: "Hustle Hardcore", size: 21)
                phraseLabel.font = font1
                phraseLabel.text = "Welcome back! I hope that now you can see all the dangerous that surround you."
                
            } else {
                
                let font2 = UIFont(name: "Hustle Hardcore", size: 72)
                phraseLabel.font = font2
                phraseLabel.text = "Pause"
                
                
            }
        }
    
    }
    
    
    @IBAction func continueGame(_ sender: Any) {
        
        if  gameOverMorreu == true {
           
            NotificationCenter.default.post(name: pausedExit, object: nil)
            self.removeFromParent()
            self.view.removeFromSuperview()
            
        } else {
           
            controladorSaiuDoJogo = false
            
            NotificationCenter.default.post(name: pausedExit, object: nil)
            self.removeFromParent()
            self.view.removeFromSuperview()
        }
    }
    
}
