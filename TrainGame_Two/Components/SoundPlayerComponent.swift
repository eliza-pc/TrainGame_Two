//
//  SoundPlayerComponent.swift
//  TrainGame_Two
//
//  Created by Eliza Maria Porto de Carvalho on 06/06/19.
//  Copyright © 2019 Academy. All rights reserved.
//

//import GameplayKit
//import AVFoundation
//import Foundation
//
//class SoundPlayer: GKComponent {
//    
//    static let soundPlayer = SoundPlayer()
//    var audioPlayer: AVAudioPlayer?
//    var sound: String = ""
//    
//    func playSoundEffect(sound:String){
//        
//        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "wav")!)
//        
//        if sound == "jump"{
//            
//            do {
//                audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
//                audioPlayer!.numberOfLoops = 0
//                audioPlayer!.prepareToPlay()
//                audioPlayer!.play()
//                audioPlayer!.setVolume(12, fadeDuration: 1)
//            } catch {
//                print("Cannot play the file")
//            }
//            
//        }
//        
//        
//    }
//  
//    
//    
//}
