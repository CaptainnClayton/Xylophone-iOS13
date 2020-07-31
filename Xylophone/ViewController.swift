//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: Properties
    var player: AVAudioPlayer?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: IBAction
    @IBAction func keyPressed(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        playSound(with: title)
    }
    
    // MARK: Private Functions
    private func playSound(with name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else { return }
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}

