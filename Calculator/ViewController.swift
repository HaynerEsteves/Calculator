//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var isDecimal: Bool = false
    private var displayValue: Double {
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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        let operation = sender.currentTitle
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
                
            } else if calcMethod == "AC" {
                displayValue = 0
                
            } else if calcMethod == "%" {
                displayValue *= 0.01
            }
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

