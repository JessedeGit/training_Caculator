//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by applelee on 22/1/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
struct CalculatorLogic {
    
    static func cal(calcMethod: String, displayValue: Double) -> Double {
        switch calcMethod{
        case "+/-": return displayValue * -1
        case "AC" : return 0
        case "%"  : return displayValue / 100
        default:
            fatalError("Switch exhusting failed!")
        }
    }
}
