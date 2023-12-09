//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Hayner Esteves on 07/12/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorLogic {
    
    //SOLUTION USING DELEGATE DESIGN PATTERN
    var delegate: CalculateViewController? = nil
    
    //SOLUTION USING PROPERTY UPDATE
    private var intermediateCalculation: (displayValue: Double, calcSymbol: String)?
    private var finalCalculationValue: Double?
    
    mutating func calculate(with symbol: String,_ number: Double ) {
        
        switch symbol {
        case "+/-":
            delegate?.displayValue *= -1
        case "AC":
            delegate?.displayValue = 0
        case "%":
            delegate?.displayValue *= 0.01
        case "=":
            if let result = self.calculate2ndPart(with: number) {
                delegate?.displayValue = result
            }
        default:
            intermediateCalculation = (displayValue: number, calcSymbol: symbol)
        }
    }
    
    private func calculate2ndPart(with number2: Double) -> Double? {
        if let intermediate = intermediateCalculation {
            
            switch intermediate.calcSymbol {
            case "+":
                return intermediate.displayValue + number2
            case "-":
                return intermediate.displayValue - number2
            case "×":
                return intermediate.displayValue * number2
            case "÷":
                return intermediate.displayValue / number2
            default:
                return nil
            }
        }
        return nil
    }
}
