//
//  BMIResult.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Daniel Filho on 02/05/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class BMIResult: UIViewController {
    
    let padding: CGFloat = 30
    var bmiResult: Float!
    let callToActionButton = BMIButton(title: "Recalculate BMI", style: "secondary")
    let bmiResultLabel = BMILabel(textLabel: "", textLabelColor: UIColor.white, textLabelType: "heading")
    
    init(bmiResult: Float!) {
        super.init(nibName: nil, bundle: nil)
        self.bmiResult = bmiResult
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBlue
        navigationController?.navigationBar.tintColor = UIColor.white
        
        configureBackgroundImageView()
        configureResultLabel()
        configureButton()
    }
    
    func configureBackgroundImageView() {
        let backgroundImage = UIImageView(frame: view.bounds)
        
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        backgroundImage.image       = UIImage(named: "result_background")
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    func configureButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(recalculateBMI), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureResultLabel(){
        view.addSubview(bmiResultLabel)
        bmiResultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bmiResultLabel.text = String(format: "%.0f", bmiResult)
        
        NSLayoutConstraint.activate([
            bmiResultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bmiResultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func recalculateBMI(){
        navigationController?.popViewController(animated: true)
    }
}
