
import UIKit

class BMIViewModel {

    private lazy var bmi = BMI()
    
    init(height: Float, weight: Float) {
        bmi.calculate(height: height, weight: weight)
    }
    
    // Calculates and return the score for the BMI result.
    public func calculate() -> String  {
        let bmiResult = String(format: "%.0f", bmi.getResult())
        return bmiResult
    }
    
    // Returns the text with the BMI classification
    public func getClassification() -> String {
        return bmi.getClassification()
    }
    
    // Returns a color based on the BMI classification
    public func getColor() -> UIColor {
        switch bmi.getClassification().lowercased() {
        case "under weight":
            return .systemOrange
        case "normal weight":
            return .systemGreen
        case "extremely obese":
            return .systemGray
        default:
            return .systemRed
        }
    }
}

