//
//  SongsViewController.swift
//  krr
//
//  Created by erti on 6/15/25.
//

import UIKit
import AVFoundation

class SongsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel1: UILabel!
    
    @IBOutlet weak var playPauseButton1: UIButton!
    @IBOutlet weak var songTitleLabel1: UILabel!
    
    @IBOutlet weak var playPauseButton2: UIButton!
    @IBOutlet weak var songTitleLabel2: UILabel!
    
    var audioPlayer1: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    
    var isPlaying1 = false
    var isPlaying2 = false

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTexts1()
        
        songTitleLabel1.text = "Койгунак"
        songTitleLabel2.text = "Ховаганнар"
        
        configurePlayer1()
        configurePlayer2()
        
        playPauseButton1.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playPauseButton2.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    
    func updateTexts1() {
        let language = UserDefaults.standard.string(forKey: "appLanguage") ?? "ru"
        
        if language == "ru" {
            titleLabel1.text = "Песни"
        } else {
            titleLabel1.text = "Ырылар"
            
        }
        
    }
    
    func configurePlayer1() {
        if let path = Bundle.main.path(forResource: "koygunak", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            audioPlayer1 = try? AVAudioPlayer(contentsOf: url)
        }
    }
    
    func configurePlayer2() {
        if let path = Bundle.main.path(forResource: "hovagannar", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            audioPlayer2 = try? AVAudioPlayer(contentsOf: url)
        }
    }
    
    @IBAction func playPauseTapped1(_ sender: UIButton) {
        let isSoundOn = UserDefaults.standard.bool(forKey: "isSoundOn")
        let volume = UserDefaults.standard.float(forKey: "soundVolume")

        guard isSoundOn else {
            print("Звук выключен в настройках")
            return
        }

        audioPlayer1?.volume = volume

        if isPlaying1 {
            audioPlayer1?.pause()
            playPauseButton1.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            audioPlayer1?.play()
            playPauseButton1.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        }
        isPlaying1.toggle()
    }
    
    @IBAction func playPauseTapped2(_ sender: UIButton) {
        let isSoundOn = UserDefaults.standard.bool(forKey: "isSoundOn")
        let volume = UserDefaults.standard.float(forKey: "soundVolume")

        guard isSoundOn else {
            print("Звук выключен в настройках")
            return
        }

        audioPlayer2?.volume = volume

        if isPlaying2 {
            audioPlayer2?.pause()
            playPauseButton2.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            audioPlayer2?.play()
            playPauseButton2.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        }
        isPlaying2.toggle()
    }
}
