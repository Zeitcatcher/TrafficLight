//
//  ViewController.swift
//  TrafficLight
//
//  Created by Arseniy Oksenoyt on 7/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var currentLight = CurrentLight.green
    private let lightIsOn:CGFloat = 1
    private let lightIsOff: CGFloat = 0.3

    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        switchButton.configuration = buttonSetup(with: "Start")
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
    }

    @IBAction func lightSwitchButton() {
        switchingLights(for: currentLight)
        
        if switchButton.configuration?.title == "Start" {
            switchButton.configuration?.title = "Next"
        }
    }
    
    
    private func switchingLights(for light: CurrentLight) {
        switch light {
        case .red:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = .green
        default:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .red
        }
    }
    
    private func buttonSetup(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 27)
        buttonConfiguration.title = title
        switchButton.layer.cornerRadius = 10
        
        return buttonConfiguration
    }
}


extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}
