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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func continueGame(_ sender: Any) {
        NotificationCenter.default.post(name: pausedExit, object: nil)
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
}
