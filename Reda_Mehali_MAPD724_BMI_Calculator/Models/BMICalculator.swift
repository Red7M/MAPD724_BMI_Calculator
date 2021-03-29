//
//  BMICalculator.swift
//  Reda_Mehali_MAPD724_BMI_Calculator
//  Student ID: 301-159-604
//  Created by Reda Mehali on 3/28/21.
//


import UIKit


struct BMICalculator {
    
    // define some variables
    var bmi: BMIModel?
    
    // define some functions
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            self.bmi = BMIModel(value: bmiValue, advice: "Underweight", color: #colorLiteral(red: 0.1058823529, green: 0.6784313725, blue: 0.9725490196, alpha: 1))
        }
        else if bmiValue < 24.9 {
            bmi = BMIModel(value: bmiValue, advice: "Normal", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }
        else if bmiValue < 29.9 {
            bmi = BMIModel(value: bmiValue, advice: "Overweight", color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        }
        else if bmiValue < 34.9 {
            bmi = BMIModel(value: bmiValue, advice: "Obese", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        }
        else {
            bmi = BMIModel(value: bmiValue, advice: "Extremely Obese", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Unable to calculate"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    
}

