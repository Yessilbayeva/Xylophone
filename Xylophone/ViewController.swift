//
//  ViewController.swift
//  Xylophone
//
//  Created by Mirrai Yessilbayeva on 14.09.2023.
//

import UIKit
import AVFAudio

class ViewController: UIViewController, AVAudioPlayerDelegate  {
    
    var Constans = Constants()
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapButton(_ sender: UIButton) {
        playSound(with: sender.currentTitle!)
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            sender.alpha = 1
        }
    }


    
    private func playSound(with melodyName: String) {
        if let url = Bundle.main.url(forResource: melodyName, withExtension: Constants.melodyExtension) {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                // Handle any errors that occur while creating or playing the audio player
                print("Error: \(error)")
            }
        } else {
            // Handle the case where the URL is nil (e.g., melodyName doesn't match a resource)
            print("URL for \(melodyName) is nil")
        }
    }
}

