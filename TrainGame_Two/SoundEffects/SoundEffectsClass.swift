//
//  SoundEffectsClass.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho, Robson James Junior, Lucídio Andrade Barbosa de Souza e André Afonso @Raj on 2019.
//  Copyright © 2019 Academy. All rights reserved.
//
// #part of the credits to Vilar da Camara Neto

import GameplayKit
import AVFoundation
import Foundation

class SoundEffects {
    
    //static let soundEffects = SoundEffects()
    var audioPlayer: AVAudioPlayer?
    var sound: String = ""
 
    
    init(soundName: String) {
        self.sound = soundName
    }
    
    
    func playSoundEffect(){
        
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "wav")!)
        
        if sound == "step2-1"{
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
                audioPlayer!.numberOfLoops = 0
                audioPlayer!.prepareToPlay()
                audioPlayer!.setVolume(60, fadeDuration: 4)
                audioPlayer!.currentTime = 0.35
                audioPlayer!.play()
                
                print("JumpSound")
            } catch {
                print("Cannot play the file")
            }
            
        }
        
        if sound == "walk1"{
           
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
                audioPlayer!.numberOfLoops = -1
                audioPlayer!.prepareToPlay()
                audioPlayer!.setVolume(100, fadeDuration: 100)
                //audioPlayer!.currentTime = 0.35
                audioPlayer!.play()
                
                print("WalkSound")
            } catch {
                print("Cannot play the file")
            }
            
        }
        
        if sound == "breathe"{
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
                audioPlayer!.numberOfLoops = -1
                audioPlayer!.prepareToPlay()
                audioPlayer!.setVolume(1, fadeDuration: 4)
                //audioPlayer!.currentTime = 0.35
                audioPlayer!.play()
                
                print("breathSound")
            } catch {
                print("Cannot play the file")
            }
        }
        
        
        
    }
    
    func pauseSong() {
      audioPlayer?.pause()
    }
    
    
    
}
