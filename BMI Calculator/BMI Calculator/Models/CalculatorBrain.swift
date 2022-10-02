//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by null on 2.10.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        
        return bmiTo1DecimalPlace
    }
    
    mutating func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    mutating func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies.", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle.", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies.", color: UIColor.red)
        }
    }
}
