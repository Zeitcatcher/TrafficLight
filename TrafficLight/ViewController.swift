//
//  ViewController.swift
//  TrafficLight
//
//  Created by Arseniy Oksenoyt on 7/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    enum Light {
        case red
        case yellow
        case green
    }
    
    var currentLight = Light.green
    var currentTitle = "Start"

    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lightsSetup()
        switchButton.configuration = buttonSetup(with: currentTitle)
    }

    @IBAction func lightSwitchButton() {
        switchingLights(for: currentLight)
    }
    
    
    private func switchingLights(for light: Light) {
        if currentTitle == "Start" {
            currentTitle = "Next"
            switchButton.configuration = buttonSetup(with: currentTitle)
        }
        
        switch light {
        case .red:
            redLight.alpha = 0.3
            yellowLight.alpha = 1
            currentLight = Light.yellow
        case .yellow:
            yellowLight.alpha = 0.3
            greenLight.alpha = 1
            currentLight = Light.green
        default:
            greenLight.alpha = 0.3
            redLight.alpha = 1
            currentLight = Light.red
        }
    }
    
    private func lightsSetup() {
        redLight.alpha = 0.3
        yellowLight.alpha = 0.3
        greenLight.alpha = 0.3
        
        redLight.layer.cornerRadius = redLight.frame.size.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.size.width / 2
        greenLight.layer.cornerRadius = redLight.frame.size.width / 2
    }
    
    private func buttonSetup(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 27)
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.title = title
        
        return buttonConfiguration
    }
}

