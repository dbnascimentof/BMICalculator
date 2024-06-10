//
//  BMIResult.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Daniel Filho on 02/05/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class BMIResult: UIViewController {
    
    private lazy var height: Float = 0
    private lazy var weight: Float = 0
    private lazy var bmiViewModel: BMIViewModel = BMIViewModel(height: self.height, weight: self.weight)
    
    init(weight: Float, height: Float){
        super.init(nibName: nil, bundle: nil)
        self.height = height
        self.weight = weight
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = bmiViewModel.getColor()
        
        let backgroundImage = UIImageView(frame: view.bounds)
        backgroundImage.image       = UIImage(named: "result_background")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        configureStackView()
        configureButton()
    }
    
    func configureStackView(){
        // Stackview configuration
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        // BMI Result
        let bmiResultLabel = BMILabel(textLabel: bmiViewModel.calculate(), textLabelColor: UIColor.white, textLabelType: "heading")
        stackView.addArrangedSubview(bmiResultLabel)
        
        // BMI Classification
        let bmiClassification = bmiViewModel.getClassification()
        let bmiClassificationLabel = BMILabel(textLabel: bmiClassification, textLabelColor: UIColor.white, textLabelType: "body")
        stackView.addArrangedSubview(bmiClassificationLabel)

    }
    
    func configureButton() {
        let callToActionButton = BMIButton(title: "Recalculate BMI", style: "secondary")
        callToActionButton.addTarget(self, action: #selector(recalculateBMI), for: .touchUpInside)
        view.addSubview(callToActionButton)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func recalculateBMI(){
        dismiss(animated: true)
    }
}
