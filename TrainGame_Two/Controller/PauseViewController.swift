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
        
        if controladorSaiuDoJogo == true {
            
            print("Setar label com frase")
            
            phraseLabel.text = "Welcome back! I hope that now you can see all the dangerous that surround you."
            phraseLabel.font.withSize(24)
            
            
        }else{
            
            phraseLabel.text = "Pause"
            phraseLabel.font.withSize(72)
            
        }
        
    }
    
    
    @IBAction func continueGame(_ sender: Any) {
        
        controladorSaiuDoJogo = false
        
        NotificationCenter.default.post(name: pausedExit, object: nil)
        self.removeFromParent()
        self.view.removeFromSuperview()
        
    }
    
}
