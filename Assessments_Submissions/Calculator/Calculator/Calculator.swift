//
//  Calculator.swift
//  Calculator
//
//  Created by Shiven Ramji on 6/2/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import Foundation

/// A calculation that holds a left term, a right term, and an operation
struct Calc<T> {
    var lt: () -> T
    var op: (T, T) -> T
    var rt: () -> T
    
    init (lt: () -> T, op: (T, T) -> T, rt: () -> T) {
        self.lt = lt
        self.op = op
        self.rt = rt
    }
    
    init (const: T) {
        self.init(lt: { const }, op: { lt, rt in lt }, rt: { const })
    }
    
    var run: (() -> T) {
        return { self.op(self.lt(), self.rt()) }
    }
    
    mutating func push(op: (T, T)->T, value: T) {
        self = Calc(lt: self.run, op: op, rt: { value })
    }
}

/// A calculator component
enum CalcPart : String {
    case Plus = "+"
    case Minus = "−"
    case Divide = "÷"
    case Multiply = "×"
    case Equal = "="
    case Decimal = "."
    case Clear = "C"
    case SwapSign = "±"
    case Percent = "%"
    case Num0 = "0"
    case Num1 = "1"
    case Num2 = "2"
    case Num3 = "3"
    case Num4 = "4"
    case Num5 = "5"
    case Num6 = "6"
    case Num7 = "7"
    case Num8 = "8"
    case Num9 = "9"
    case Display = ""
    
    /// All the parts that can be tapped (everything but the display)
    static var allButtons: [CalcPart] = [ .Plus, .Minus, .Divide, .Multiply, .Equal, .Decimal, .Clear, .SwapSign, .Percent, .Num0, .Num1, .Num2, .Num3, .Num4, .Num5, .Num6, .Num7, .Num8, .Num9 ]
}

/// A numeric entry area that handles partially-entered numbers such as "-0."
struct CalcDisplay : Printable {
    var number: UInt = 0
    var exponent: UInt = 0
    var fraction = false
    var positive = true
    
    /// The currently entered number as a Double
    var decimalValue: Double {
        return (positive ? +1 : -1) * Double(number) / pow(10, Double(exponent))
    }
    
    var description : String {
        if fraction {
            let desc = String(format: "%.\(exponent+1)f", self.decimalValue)
            return dropLast(desc)
        } else {
            return String(format: "%g", self.decimalValue)
        }
    }
    
    mutating func appendDigit(digit: UInt) {
        number *= 10
        number += digit
        if fraction {
            exponent++
        }
    }
    
    mutating func reset() {
        self = CalcDisplay()
    }
}

typealias CalcOp = (Double, Double)->Double

enum CalcMode {
    case Entry
    case Result(CalcOp)
}

struct CalcState : Printable {
    var calc: Calc<Double> = Calc(const: 0)
    var curop: CalcOp = (+)
    var mode: CalcMode = .Entry
    var display: CalcDisplay = CalcDisplay()
    var suffix = ""
    
    var description: String {
        switch mode {
        case .Entry:
            return display.description
        case .Result(let op):
            return String(format: "%g%@", calc.run(), suffix)
        }
    }
    
    mutating func toMode(newmode: CalcMode) {
        switch (mode, newmode) {
        case (.Entry, .Result(let newop)):
            calc.push(curop, value: display.decimalValue)
            mode = .Result(newop)
            display.reset()
            curop = newop
        case (.Result, .Entry):
            display.reset()
            mode = .Entry
        case (.Entry, .Entry):
            mode = newmode
        case (.Result, .Result(let newop)):
            mode = newmode
            curop = newop
        }
    }
    
    mutating func enterOperation(op: CalcOp, value: Double? = nil, suffix: String = "") {
        self.suffix = suffix
        
        if let value = value {
            toMode(.Result(op))
            calc.push(op, value: value)
        } else {
            toMode(.Result(op))
        }
    }
    
    mutating func enterDigit(digit: UInt) {
        toMode(.Entry)
        display.appendDigit(digit)
    }
    
    mutating func enterDecimal() {
        toMode(.Entry)
        display.fraction = true
    }
}







/*enum Digit {
    case One
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Dot
}

enum Operation {
    case Multiply
    case Divide
    case Add
    case Subtract
}


class Calculator {
    func calculate() {

    }

    func getResult() ->Double{
        return -1.0
    }
}

func test(Calculator: Calculator, userTyped:(left:[Digit], op:Operation, right:[Digit])) ->Double {
    Calculator.calculate()
    return answer == calculator.getResult()
}


let myCALC = Calculator()
TEST(myCALC, (left:[.one], op:[.Add], right:[.two])
*/