//
//  VilarExtension.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto

import Foundation
import SpriteKit

extension Array where Element == SKTexture {
    init(withFormat format: String, range: ClosedRange<Int>) {
        self = range.map { (index) in
            let imageName = String(format: format, index)
            return SKTexture(imageNamed: imageName)
        }
    }
}
