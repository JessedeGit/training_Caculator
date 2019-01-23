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
    
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else {fatalError("Cannot convert display label text to a Double!")}
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        if let calcMethod = sender.currentTitle {
            if let returnValue =  CalculatorLogic.cal(calcMethod: calcMethod, displayValue: displayValue){
                displayValue = returnValue
            }else{
                displayLabel.text = calcMethod
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            else{
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {return}
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

