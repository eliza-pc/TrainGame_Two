//
//  BackgroundMusicClass.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto

import Foundation
import AVFoundation

class BackgroundMusicClass {
    static let backgroundMusic = BackgroundMusicClass()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "BackgroundSound", ofType: "wav")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.setVolume(5, fadeDuration: 4)
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}

