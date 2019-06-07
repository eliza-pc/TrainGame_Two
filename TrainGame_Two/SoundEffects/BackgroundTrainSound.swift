//
//  BackgroundTrainSound.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 07/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import AVFoundation

class BackgroundTrainSound {
    static let backgroundTrainSound = BackgroundTrainSound()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundTrainSound() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "train", ofType: "wav")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.setVolume(3, fadeDuration: 4)
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}
