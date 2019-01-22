//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by applelee on 22/1/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
class CalculatorLogic {
    
    static func cal(calcMethod: String, displayValue: Double) -> Double? {
        switch calcMethod{
        case "+/-": return displayValue * -1
        case "AC": return 0
        case "%": return 100
        default:
            print("switch exhust failed!")
            return 0
        }
    }
}
