//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber = true
    
    private var displayValue:Double{
        get{
            guard let number = Double(displayLabel.text!) else {fatalError("Cannot convert display label text to a Double!")}
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        if let calcMethod = sender.currentTitle {
            displayValue = CalculatorLogic.cal(calcMethod: calcMethod, displayValue: displayValue)
        }

    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber{
                displayValue = Double(numValue) ?? 0
                isFinishedTypingNumber = false
            }
            else{
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {return}
                }
                displayValue = displayValue * 10 + (Double(numValue) ?? 0)
            }
        }
    }
}

