//
//  ViewController.swift
//  Calculator
//
//  Created by Shiven Ramji on 5/26/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayScreen: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    
    var userIsTypingANumber : Bool = false
    var IsPositive : Bool = true
    var IsDecimalAlready : Bool = false
    var operatorPressed : String = ""
    var operandStack = Array<Double>()
    
    var displayValue : Double {
        
        get{
                return NSNumberFormatter().numberFromString(self.displayScreen.text!)!.doubleValue
        }
        set {
            
            displayScreen.text = "\(newValue)"
            userIsTypingANumber = false
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.titleLabel!.text!
        if userIsTypingANumber && isDouble(displayScreen.text!) {
            //displayValue = displayValue * -1
            //displayScreen.text = displayValue.description
            displayValue = NSString(string: displayScreen.text! + digit).doubleValue
            displayScreen.text = displayScreen.text! + digit
            self.clearButton.titleLabel?.text = "C"
            
        } else
        {
            
            displayValue = NSString(string: digit).doubleValue
            self.clearButton.titleLabel?.text = "AC"
            userIsTypingANumber = false
            operandStack.append(displayValue)
            println("\(operandStack)")
            
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double)
    {
        if operandStack.count >= 2{
            displayValue = operation (operandStack.removeLast(), operandStack.removeLast())
            userIsTypingANumber = false
            operandStack.append(displayValue)
            println("\(operandStack)")
            println("\(displayValue)")
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        operatorPressed = sender.titleLabel!.text!
        if userIsTypingANumber {
            userIsTypingANumber = true
            operandStack.append(displayValue)
            println("\(operandStack)")
        }
        
    }
    
    /*
    This function checks to see if the input values have a decimal or not, and returns a bool
    */
    func isDouble(number:String) ->Bool {
        return NSString(string: number).containsString(".")
    }
    
    // MARK: - Toggle Positive / Negative
    @IBAction func togglePositiveNegative(sender: AnyObject) {
        // Check to see if the display screen is a double. If yes, then convert to Double and we are good
        if isDouble(displayScreen.text!){
            displayValue = displayValue * -1
            displayScreen.text = displayValue.description
        }
        else { // Do not convert to Double, convert to Int instead
            let newDisplayNumber = displayScreen.text!.toInt()! * -1
            displayScreen.text = newDisplayNumber.description
        }
        
    }
    
    func updateDisplay()
    {
        self.displayScreen.text = displayValue.description
    }
    
    
    @IBAction func clearDisplay(sender: UIButton) {
        let buttonState = sender.titleLabel!.text!
        switch buttonState {
        case "C":
            userIsTypingANumber = false
            displayScreen.text = "0"
        case "AC":
            operandStack.removeAll(keepCapacity: true)
            userIsTypingANumber = false
        default: break
            
        }
    }
    
    
    
    @IBAction func calculateEqual() {
        
        println("\(operandStack)")
        
        switch operatorPressed {
        case "÷":
            performOperation { $1 / $0 }
        case "×":
            performOperation { $0 * $1 }
        case "−":
            performOperation { $1 - $0 }
        case "+":
            performOperation { $0 + $1 }
            println("we got here")
        default: break
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

