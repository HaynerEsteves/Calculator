//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculator = CalculatorLogic()
    private var isFinishedTypingNumber: Bool = true
    private var isDecimal: Bool = false
    var displayValue: Double {
        get {
            guard let doubleValue = Double(displayLabel.text!) else {
                fatalError("error casting displayLabel.text into double")
            }
            return doubleValue
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    override func viewDidLoad() {
        calculator.delegate = self
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        if let calcMethod = sender.currentTitle {
                calculator.calculate(with: calcMethod, displayValue)
        }
        
        isFinishedTypingNumber = true
        isDecimal = false
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            //it restarts the cicle for number
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                
            } else {
                
                if numValue == "." {
                    if isDecimal {
                        return
                    } else {
                        isDecimal = true
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    }
}

