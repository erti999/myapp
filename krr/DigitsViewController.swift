//
//  DigitsViewController.swift
//  krr
//
//  Created by erti on 6/15/25.
//

import UIKit
import AVKit

class DigitsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        closeButton.isHidden = true
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
            guard let number = sender.accessibilityIdentifier else { return }
            let imageName = "\(number).png"
            
            if let image = UIImage(named: imageName) {
                imageView.image = image
                imageView.isHidden = false
                closeButton.isHidden = false
            } else {
                print("Картинка \(imageName) не найдена")
            }
        }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
            imageView.isHidden = true
            closeButton.isHidden = true
        }
}
