//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var noteSnd: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        let note = Int(sender.tag)
        playNote(note: note)
    }
    
    func playNote(note: Int) {
        let path = Bundle.main.path(forResource: "note\(note)", ofType: "wav")
        print("note\(note)")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            //tanimladigimiz URL kullanilarak audio stream yapilacak
            try noteSnd = AVAudioPlayer(contentsOf: soundURL)
            //calmaya hazirla
            noteSnd.prepareToPlay()
            } catch let err as NSError {
                //stream yapilamazsa error ver
                print(err.debugDescription)
            }
        
        if noteSnd.isPlaying {
                noteSnd.stop()
        }
        
        noteSnd.play()
    }
}

