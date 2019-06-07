//
//  BackgroundMusicClass.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 07/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

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
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}

