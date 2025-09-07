//
//  AlphabetViewController.swift
//  krr
//
//  Created by erti on 6/14/25.
//

import UIKit
import AVFoundation

class AlphabetViewController: UIViewController {

    @IBOutlet weak var letterImageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letterImageView.isHidden = true
        closeButton.isHidden = true
    }
    
    @IBAction func letterButtonTapped(_ sender: UIButton) {
        guard let letter = sender.accessibilityIdentifier else { return }

        // Показ картинки
        let image = UIImage(named: "\(letter).png")
        letterImageView.image = image
        letterImageView.isHidden = false
        closeButton.isHidden = false
        
        // Проверка: включён ли звук
        let isSoundOn = UserDefaults.standard.bool(forKey: "isSoundOn")
        if isSoundOn {
            if let soundURL = Bundle.main.url(forResource: letter, withExtension: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    let volume = UserDefaults.standard.float(forKey: "soundVolume")
                    audioPlayer?.volume = volume
                    audioPlayer?.play()
                } catch {
                    print("Ошибка воспроизведения аудио: \(error)")
                }
            } else {
                print("Файл \(letter).mp3 не найден")
            }
        } else {
            print("Звук выключен через настройки")
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        letterImageView.isHidden = true
        closeButton.isHidden = true
        audioPlayer?.stop()
    }
}
