//
//  MultsViewController.swift
//  krr
//
//  Created by erti on 6/15/25.
//

import UIKit
import AVKit

class MultsViewController: UIViewController {

    
    @IBAction func playTeveTapped(_ sender: UIButton) {
        playVideo(named: "teve")
    }
    
    @IBAction func playKolobokTapped(_ sender: UIButton) {
        playVideo(named: "kolobok")
    }
    func playVideo(named fileName: String) {
            if let path = Bundle.main.path(forResource: fileName, ofType: "mp4") {
                let player = AVPlayer(url: URL(fileURLWithPath: path))
                let playerController = AVPlayerViewController()
                playerController.player = player
                present(playerController, animated: true) {
                    player.play()
                }
            } else {
                print("Файл не найден: \(fileName).mp4")
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
