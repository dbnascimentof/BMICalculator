//
//  BMIButton.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Daniel Filho on 01/05/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class BMIButton: UIButton {

    var buttonCornerRadius: CGFloat = 10
    var buttonTitle: String!
    var buttonFontColor: UIColor!
    var buttonBackgroundColor: UIColor!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, style: String) {
        super.init(frame: .zero)
        
        self.buttonTitle = title
        
        switch style.lowercased() {
        case "secondary":
            self.buttonBackgroundColor  = UIColor.white
            self.buttonFontColor        = UIColor(named: "BMIPurple")
            configure()
            
        default:
            self.buttonBackgroundColor  = UIColor(named: "BMIPurple")
            self.buttonFontColor        = UIColor.white
            configure()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        setTitle(self.buttonTitle, for: .normal)
        setTitleColor(self.buttonFontColor, for: .normal)
        layer.cornerRadius      = self.buttonCornerRadius
        self.backgroundColor    = self.buttonBackgroundColor
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .callout)
    }
    
}
