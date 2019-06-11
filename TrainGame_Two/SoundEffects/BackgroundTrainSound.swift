//
//  BackgroundTrainSound.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto

import Foundation
import AVFoundation

class BackgroundTrainSound {
    static let backgroundTrainSound = BackgroundTrainSound()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundTrainSound() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "train", ofType: "wav")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = 0
            audioPlayer!.prepareToPlay()
            audioPlayer!.setVolume(0.3, fadeDuration: 4)
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}
