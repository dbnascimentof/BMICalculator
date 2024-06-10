//
//  BMI.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Daniel Filho on 08/06/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

class BMI {
    private lazy var result: Float = 0
    private lazy var classification: String = ""
    
    public func calculate(height: Float , weight: Float) {
        self.result = weight / (height * height)
        self.classifyResult()
    }
    
    private func classifyResult(){
        if self.result < 18.5 {
            self.classification = "UNDER WEIGHT"
        } else if self.result >= 18.5 && self.result <= 24.9 {
            self.classification = "NORMAL WEIGHT"
        } else if self.result >= 25 && self.result <= 29.9 {
            self.classification = "OVERWEIGHT"
        } else if self.result >= 30 && self.result <= 34.9 {
            self.classification = "OBESE"
        } else if self.result > 35 {
            self.classification = "EXTREMELY OBESE"
        }
    }
    
    public func getResult() -> Float  {
        return self.result
    }
    
    public func getClassification() -> String {
        return self.classification
    }
    
}
