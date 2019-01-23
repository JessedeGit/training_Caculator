//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by applelee on 22/1/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
struct CalculatorLogic {
    
    static private var intermediateCalculation: (n1: Double, calcM: String)?
    
    static func cal(calcMethod: String, displayValue: Double) -> Double? {
        switch calcMethod{
        case "+/-": return displayValue * -1
        case "AC" : return 0
        case "%"  : return displayValue / 100
        case "=": return performCalc(n2:displayValue)
        default: intermediateCalculation = (n1: displayValue, calcM: calcMethod)
            return nil
        }
    }
    static private func performCalc(n2: Double) -> Double?{
        if let n1 = intermediateCalculation?.n1 {
            if let oper = intermediateCalculation?.calcM{
                switch oper {
                case "+": return n1 + n2
                case "-": return n1 - n2
                case "×": return n1 * n2
                case "÷": return n1 / n2
                default:
                    return nil
                }
            }
        }
        return nil
    }
}
