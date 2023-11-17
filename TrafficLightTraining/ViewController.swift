//
//  ViewController.swift
//  TrafficLightTraining
//
//  Created by Natalia Ovdina on 17.11.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var button: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn = 1.0
    private let lightIsOff = 0.4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 10
        
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }


    @IBAction func didButtonTapped() {
        if button.currentTitle == "START" {
            button.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redView.alpha = lightIsOn
            greenView.alpha = lightIsOff
            currentLight = .yellow
        case .yellow:
            yellowView.alpha = lightIsOn
            redView.alpha = lightIsOff
            currentLight = .green
        case .green:
            yellowView.alpha = lightIsOff
            greenView.alpha = lightIsOn
            currentLight = .red
            
        }
    }
}

// MARK: - Current Light
extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}
