//
//  SoundPlayerComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 06/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import GameplayKit
import AVFoundation
import Foundation

class SoundPlayer: GKComponent {
    
    static let soundPlayer = SoundPlayer()
    var audioPlayer: AVAudioPlayer?
    var sound: String = ""
    
    func playSong(sound:String){
        
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "wav")!)
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
