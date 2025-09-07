//
//  SlovarViewController.swift
//  krr
//
//  Created by erti on 6/15/25.
//

import UIKit
import AVKit

class SlovarViewController: UIViewController {

    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var button33: UIButton!
    @IBOutlet weak var button44: UIButton!
    @IBOutlet weak var button55: UIButton!
    @IBOutlet weak var button66: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTexts2()
    }

    func updateTexts2() {
        let language = UserDefaults.standard.string(forKey: "appLanguage") ?? "ru"
        
        if language == "ru" {
            titleLabel1.text = "Тематический словарик"
            button11.setTitle("Родственные отношения", for: .normal)
            button22.setTitle("Тувинские блюда", for: .normal)
            button33.setTitle("Наименование животных", for: .normal)
            button44.setTitle("Глаголы", for: .normal)
            button55.setTitle("Природные явления", for: .normal)
            button66.setTitle("Цвета", for: .normal)
        } else {
            titleLabel1.text = "Темалыг словарь"
            button11.setTitle("Төрел бөлүк аттары", for: .normal)
            button22.setTitle("Тыва аъш-чем аттары", for: .normal)
            button33.setTitle("Дириг амытаннар аттары", for: .normal)
            button44.setTitle("Кылыг сөстери", for: .normal)
            button55.setTitle("Бойдус болуушкуннары", for: .normal)
            button66.setTitle("Өң", for: .normal)
        }
    }
    
}
