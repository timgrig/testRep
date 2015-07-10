//
//  ViewController.swift
//  Calculator
//
//  Created by Тимошин Григорий on 12.02.15.
//  Copyright (c) 2015 EcoSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber : Bool = false
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
                display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.puchOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            println (display.text!)
            let v = (display.text! as NSString).doubleValue
            return v //NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }         set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}
