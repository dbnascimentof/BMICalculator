//
//  HomeVC.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Daniel Filho on 01/05/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class BMICalc: UIViewController {
    
    let padding: CGFloat = 30
    
    // UI Elements
    let titleLabel = BMILabel(textLabel: "Calculate your BMI", textLabelColor: UIColor(named: "BMIPurple")!, textLabelType: "title")
    var weightLabel = BMILabel(textLabel: "", textLabelColor: UIColor(named: "BMIPurple")!, textLabelType: "body")
    let weightSlider = UISlider()
    var heightLabel = BMILabel(textLabel: "", textLabelColor: UIColor(named: "BMIPurple")!, textLabelType: "body")
    let heightSlider = UISlider()
    let callToActionButton = BMIButton(title: "Calculate BMI", style: "primary")

    override func viewDidLoad() {
        super.viewDidLoad()

        configureBackgroundImageView()
        configureTitle()
        configureButton()
        configureWeightSlider()
        configureWeightLabel()
        configureHeightSlider()
        configureHeightLabel()
    }
    
    func configureBackgroundImageView() {
        let backgroundImage = UIImageView(frame: view.bounds)
        
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        backgroundImage.image       = UIImage(named: "calculate_background")
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    func configureTitle() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configureHeightLabel() {
        view.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: -20),
            heightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func configureHeightSlider(){
        view.addSubview(heightSlider)
        heightSlider.translatesAutoresizingMaskIntoConstraints = false
        heightSlider.addTarget(self, action: #selector(updateSlideValue), for: .touchDragInside)
        
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 2
        heightSlider.tintColor = UIColor(named: "BMIPurple")
        updateSlideValue()
        
        NSLayoutConstraint.activate([
            heightSlider.bottomAnchor.constraint(equalTo: weightLabel.topAnchor, constant: -padding),
            heightSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            heightSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            heightSlider.heightAnchor.constraint(equalToConstant: padding)
        ])
    }
    
    
    func configureWeightLabel() {
        view.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weightLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: -20),
            weightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func configureWeightSlider(){
        view.addSubview(weightSlider)
        weightSlider.translatesAutoresizingMaskIntoConstraints = false
        weightSlider.addTarget(self, action: #selector(updateSlideValue), for: .touchDragInside)
        
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 200
        weightSlider.tintColor = UIColor(named: "BMIPurple")
        updateSlideValue()
        
        NSLayoutConstraint.activate([
            weightSlider.bottomAnchor.constraint(equalTo: callToActionButton.topAnchor, constant: -padding),
            weightSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            weightSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            weightSlider.heightAnchor.constraint(equalToConstant: padding)
        ])
    }
    
    
    @objc func updateSlideValue() {
        heightLabel.text = "Height: \(String(format: "%.2f", heightSlider.value))"
        weightLabel.text = "Weight: \(String(format: "%.0f", weightSlider.value))"
    }
    
    
    func configureButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(calcBMI), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func calcBMI(){
        navigationController?.modalPresentationStyle = .formSheet
        //present(BMIResult(bmiResult: bmiResult), animated: true)
        present(BMIResult(weight: weightSlider.value, height: heightSlider.value), animated: true)
    }
}
