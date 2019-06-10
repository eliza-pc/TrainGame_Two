//
//  PauseViewController.swift
//  TrainGame_Two
//
//  Created by Robson James Junior on 09/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import UIKit


class PauseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func continueGame(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
}
