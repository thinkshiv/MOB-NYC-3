//
//  ViewController.swift
//  Calculator
//
//  Created by Shiven Ramji on 5/26/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Declare Outlet References
    @IBOutlet weak var displayScreen: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    
    // MARK: - Declare global variables
    var userIsTypingANumber : Bool = false
    var IsIntOnly : Bool = true
    var DotPressed : Bool = false
    var IsDecimalAlready : Bool = false
    var operatorPressed : String = ""
    var operandStack = Array<Double>()
    var displayString : String = ""
    var countDotPressed : Int = 0
    var countCleared : Int = 0
    
    var displayValue : Double {
        
        get{
            return NSNumberFormatter().numberFromString(self.displayScreen.text!)!.doubleValue
        }
        set {
            
            displayScreen.text = "\(newValue)"
            //userIsTypingANumber = false
        }
    }
    
    
    // MARK: New code
    /*

    var calcstack : Array<CalcState> = []
    
    func undo() -> CalcState {
        if calcstack.count > 0 {
            calcstack.removeLast()
        }
        
        return calcstack.last ?? CalcState()
    }
    
    func press(part: CalcPart) -> CalcState {
        var calc = calcstack.last ?? CalcState()
        
        switch part {
        case .Display: return calc // no-op
        case .Num0: calc.enterDigit(0)
        case .Num1: calc.enterDigit(1)
        case .Num2: calc.enterDigit(2)
        case .Num3: calc.enterDigit(3)
        case .Num4: calc.enterDigit(4)
        case .Num5: calc.enterDigit(5)
        case .Num6: calc.enterDigit(6)
        case .Num7: calc.enterDigit(7)
        case .Num8: calc.enterDigit(8)
        case .Num9: calc.enterDigit(9)
        case .Minus: calc.enterOperation(-, suffix: part.rawValue)
        case .Plus: calc.enterOperation(+, suffix: part.rawValue)
        case .Divide: calc.enterOperation(/, suffix: part.rawValue)
        case .Multiply: calc.enterOperation(*, suffix: part.rawValue)
        case .SwapSign: calc.enterOperation(*, value: -1.0)
        case .Percent: calc.enterOperation(/, value: 100)
        case .Equal: calc.enterOperation(calc.curop)
        case .Decimal: calc.enterDecimal()
        case .Clear: return undo()
        }
        
        calcstack += [calc]
        return calc
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let digit = sender.titleLabel!!.text!
        println(digit)
        println(sender.displayString)
        //calcstack.append(
        
    }
    
    

    */
    
    
    
    
    // MARK: - Old code
    
    @IBAction func dotButtonPressed(sender: UIButton) {
        
        if countDotPressed == 0{
            DotPressed = true
            IsIntOnly = false
            println(IsIntOnly)
            displayString =  displayScreen.text! + "."
            println("displayString is after dot is " + displayString)
            displayScreen.text = displayString
            countDotPressed++
        }
        else
        {
            //Do Nothing
        }
        
    }
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.titleLabel!.text!
        println(digit)
        //IsIntOnly = true
        
        if userIsTypingANumber {
            
            displayString =  displayScreen.text! + digit
            println("First display string is " + displayString)
            displayScreen.text = displayString
            
            
        } else {
            
            
            userIsTypingANumber = true
            displayString =  digit
            displayScreen.text = displayString
            println("Second displayString is " + displayString + " and Second displayValue is \(displayValue)")
            
            println("operandStack during else within appendDigits is: \(operandStack)")
            
        }
        
        
        //if countCleared == 0 {
            self.clearButton.titleLabel?.text = "C"
       // }
        println("cleared pressed \(countCleared) times")
        displayValue = NSString(string: displayString).doubleValue
        operandStack.append(displayValue)
        println("operandStack during appendDigits is: \(operandStack)")
        
        updateDisplay()
    }
    
    
    func performOperation(operation: (Double, Double) -> Double)
    {
        if operandStack.count >= 2{
            displayValue = operation (operandStack.removeLast(), operandStack.removeLast())
            userIsTypingANumber = false
            operandStack.append(displayValue)
            displayString = displayValue.description
            println("operandStack during performOperation is: \(operandStack)")
            println("\(displayValue)")
        }
    }
    
    
    @IBAction func percentButtonTapped(sender: UIButton) {
        displayString =  displayScreen.text!
        displayValue = NSString(string: displayString).doubleValue
        operandStack.append(displayValue)
        displayValue = operandStack.removeLast() / 100
        println(" % value is now \(displayValue)")
        displayString = displayValue.description
        //self.displayScreen.text = displayValue.description
        IsIntOnly=true
        updateDisplay()
        operandStack.append(displayValue)
        
    }
    @IBAction func operate(sender: UIButton) {
        operatorPressed = sender.titleLabel!.text!
        userIsTypingANumber=false
        println("displayString at operate button is \(displayString)")
        println("operandStack during operate button is: \(operandStack)")
    }
    
    /*
    This function checks to see if the input values have a decimal or not, and returns a bool
    */
    func isDouble(number:String) ->Bool {
        return NSString(string: number).containsString(".")
    }
    
    // MARK: - Toggle Positive / Negative
    @IBAction func togglePositiveNegative(sender: AnyObject) {
        if operandStack.count == 0
        {
            displayScreen.text = "0"
        }
        else{
            
            displayValue = displayValue * -1
           
            displayScreen.text = displayValue.description
            displayString = displayValue.description
            operandStack.append(displayValue)
            
            println("operandStack during Toggle after Double check is: \(operandStack)")
            userIsTypingANumber=false
            updateDisplay()
            println("displayString at tend of Toggle is \(displayString) after updateDisplay()")
        }
    }
    
    func updateDisplay()
    {
        let dotIndex: Character = "."
        println("displayString within updateDisplay() \(displayString)")
        
        if IsIntOnly && NSString(string: displayString).containsString(".")
        {
            
            print("Is it int or not within updateDisplay() \(IsIntOnly)")
            if let idx = find(displayString, dotIndex) {
                
                self.displayScreen.text = displayString.substringToIndex(idx)
                println("Found \(dotIndex) at position \(idx)")
            }

        }
        else {
            IsIntOnly = false
            self.displayScreen.text =  displayString
        }
        
    }
    
    
    @IBAction func clearDisplay(sender: UIButton) {
        let buttonState = sender.titleLabel!.text!
        switch buttonState {
        case "C":
            userIsTypingANumber = false
            displayScreen.text = "0"
            displayString = displayScreen!.text!
            updateDisplay()
            countCleared++
            if countCleared >= 1{
                self.clearButton.titleLabel?.text = "AC"
            }
            
        case "AC":
            operandStack.removeAll(keepCapacity: true)
            userIsTypingANumber = false
            displayScreen.text = "0"
            countCleared = 0
        default: break
            
        }
    }
    
    
    
    @IBAction func calculateEqual() {
        
        println("\(operandStack)")
        
        switch operatorPressed {
        case "÷":
            performOperation { $1 / $0 }
            println("dividing last two numbers")
        case "×":
            performOperation { $0 * $1 }
            println("multiplying last two numbers")
        case "−":
            performOperation { $1 - $0 }
            println("subtracting last two numbers")
        case "+":
            performOperation { $0 + $1 }
            println("adding last two numbers")
        default: break
            
        }
        updateDisplay()
        IsIntOnly=true
        
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

