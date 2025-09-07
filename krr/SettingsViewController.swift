//
//  SettingsViewController.swift
//  krr
//
//  Created by erti on 6/14/25.
//

import UIKit
import AVKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var soundSegmentControl: UISegmentedControl!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func soundSettingChanged(_ sender: UISegmentedControl) {
        let isSoundOn = sender.selectedSegmentIndex == 1
        UserDefaults.standard.set(isSoundOn, forKey: "isSoundOn")
    }
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        let volume = sender.value
        UserDefaults.standard.set(volume, forKey: "soundVolume")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Установить значение по умолчанию для isSoundOn, если оно ещё не задано
        if UserDefaults.standard.object(forKey: "isSoundOn") == nil {
            UserDefaults.standard.set(true, forKey: "isSoundOn")
        }
        
        // Получаем текущее состояние
        let isSoundOn = UserDefaults.standard.bool(forKey: "isSoundOn")
        soundSegmentControl.selectedSegmentIndex = isSoundOn ? 1 : 0
        
        // Получаем громкость, если не задана — ставим 1.0
        let volume = UserDefaults.standard.object(forKey: "soundVolume") != nil
            ? UserDefaults.standard.float(forKey: "soundVolume")
            : 1.0
        volumeSlider.value = volume
        
        let currentLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? "ru"
        languageSegmentControl.selectedSegmentIndex = (currentLanguage == "ru") ? 0: 1 
    }
    
    
    @IBOutlet weak var languageSegmentControl: UISegmentedControl!
    @IBAction func languageChanged(_ sender: UISegmentedControl) {
        let selectedLanguage = sender.selectedSegmentIndex == 0 ? "ru" : "ty"
        UserDefaults.standard.set(selectedLanguage, forKey: "appLanguage")
    }
    
}
