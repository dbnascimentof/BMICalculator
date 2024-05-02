//
//  BMILabel.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Daniel Filho on 01/05/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class BMILabel: UILabel {

    var textLabel: String!
    var textLabelColor: UIColor!
    var textLabelSize: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    init(textLabel: String, textLabelColor: UIColor, textLabelType: String) {
        super.init(frame: .zero)
        self.textLabel = textLabel
        self.textLabelColor = textLabelColor
        
        switch textLabelType.lowercased() {
        case "title":
            self.textLabelSize = 30
        case "heading":
            self.textLabelSize = 120
        default:
            self.textLabelSize = 18
        }
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        text             = self.textLabel
        textColor        = self.textLabelColor
        font             = UIFont.systemFont(ofSize: self.textLabelSize, weight: .bold)
        textAlignment    = .center
    }
}
