//
//  SoundEffectsClass.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 07/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import GameplayKit
import AVFoundation
import Foundation

class SoundEffects {
    
    static let soundEffects = SoundEffects()
    var audioPlayer: AVAudioPlayer?
    var sound: String = ""
    
    func playSoundEffect(sound:String){
        
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "wav")!)
        
        if sound == "jump"{
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
                audioPlayer!.numberOfLoops = 0
                audioPlayer!.prepareToPlay()
                audioPlayer!.setVolume(300, fadeDuration: 4)
                audioPlayer!.currentTime = 0.35
                audioPlayer!.play()
                
                print("JumpSound")
            } catch {
                print("Cannot play the file")
            }
            
        }
        
        
    }
    
    
    
}
