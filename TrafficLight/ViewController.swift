//
//  ViewController.swift
//  TrafficLight
//
//  Created by Данис Гаязов on 19.6.24..
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Enums
    enum TrafficLight {
    case red, yellow, green
    }
    
    // MARK: - Properties
    private let lightIsOffState = 0.3
    private let lightIsOnState = 1.0
    private var currentLight: TrafficLight = .green
    
    // MARK: - IB Outlets
    @IBOutlet var redTrafficLight: UIView!
    @IBOutlet var yellowTrafficLight: UIView!
    @IBOutlet var greenTrafficLight: UIView!
    @IBOutlet var actionButton: UIButton!
  
    // MARK: - IBActions
    @IBAction func actionButtonDidTapped(_ sender: UIButton) {
        actionButton.setTitle("Next", for: .normal)
        changeTrafficLightState()
    }
   
    // MARK: - Public Methods
    func changeTrafficLightState() {
        switch currentLight {
        case .red:
            yellowTrafficLight.alpha = lightIsOnState
            redTrafficLight.alpha = lightIsOffState
            currentLight = .yellow
        case .yellow:
            greenTrafficLight.alpha = lightIsOnState
            yellowTrafficLight.alpha = lightIsOffState
            currentLight = .green
        case .green:
            redTrafficLight.alpha = lightIsOnState
            greenTrafficLight.alpha = lightIsOffState
            currentLight = .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButton.setTitle("Start", for: .normal)
        actionButton.layer.cornerRadius = 10
        setupTrafficLight(redTrafficLight)
        setupTrafficLight(yellowTrafficLight)
        setupTrafficLight(greenTrafficLight)

        func setupTrafficLight(_ light: UIView) {
            light.layer.cornerRadius = light.frame.size.width / 2
            light.alpha = lightIsOffState
        }
    }
}

