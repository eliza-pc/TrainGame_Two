//
//  VilarExtension.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 31/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

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
