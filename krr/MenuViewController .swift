//
//  MenuViewController .swift
//  krr
//
//  Created by erti on 6/14/25.
//

import UIKit
import AVKit

class MenuViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTexts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            updateTexts()
        }

        func updateTexts() {
            let language = UserDefaults.standard.string(forKey: "appLanguage") ?? "ru"

            
            
            
            if language == "ru" {
                titleLabel.text = "Говорящий алфавит"
                button1.setTitle("Тувинский алфавит", for: .normal)
                button2.setTitle("Тематический словарик", for: .normal)
                button3.setTitle("Числа", for: .normal)
                button4.setTitle("Мультики", for: .normal)
                button5.setTitle("Песни", for: .normal)
                button6.setTitle("Стишки", for: .normal)
            } else {
                titleLabel.text = "Чугааланыр үжүктер"
                button1.setTitle("Тыва алфавит", for: .normal)
                button2.setTitle("Темалыг словарь", for: .normal)
                button3.setTitle("Саннар", for: .normal)
                button4.setTitle("Мультиктер", for: .normal)
                button5.setTitle("Ырылар", for: .normal)
                button6.setTitle("Шүлүктер", for: .normal)
            }
        }

}
