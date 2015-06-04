//
//  Calculator.swift
//  CalcTestWithCode
//
//  Created by Shiven Ramji on 6/3/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

/// A calculation that holds a left term, a right term, and an operation
struct Calc<T> {
    var lt: () -> T
    var op: (T, T) -> T
    var rt: () -> T
    
    init(lt: () -> T, op: (T, T) -> T, rt: () -> T) {
        self.lt = lt
        self.op = op
        self.rt = rt
    }
    
    init(const: T) {
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

import Foundation

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

import UIKit

class CalcPartView: UILabel {
    let type: CalcPart
    let handler: () -> Void
    
    init(type: CalcPart, handler: () -> Void = { }) {
        self.type = type
        self.handler = handler
        
        super.init(frame: CGRectZero)
        
        self.textAlignment = .Center
        self.layer.borderWidth = 0.5
        self.font = UIFont.systemFontOfSize(45)
        self.adjustsFontSizeToFitWidth = true
        self.userInteractionEnabled = true
        
        self.text = String(type.rawValue)
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        switch type { // set the appropriate background based on the kind of button
        case .Display:
            self.textColor = UIColor.whiteColor()
            self.backgroundColor = UIColor.blackColor()
            self.textAlignment = .Right
        case .Plus, .Multiply, .Minus, .Divide, .Equal:
            self.textColor = UIColor.whiteColor()
            self.backgroundColor = UIColor.orangeColor()
        case .Clear, .SwapSign, .Percent:
            self.textColor = UIColor.blackColor()
            self.backgroundColor = UIColor(white: 0.78, alpha: 1.0)
        default:
            self.textColor = UIColor.blackColor()
            self.backgroundColor = UIColor(white: 0.84, alpha: 1.0)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.layer.borderWidth = 2.0
        handler()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        self.layer.borderWidth = 0.5
    }
}

extension CalcPart {
    var viewid : String {
        // “View names must start with a letter or an underscore, then contain letters, numbers, and underscores.”
        return "v" + join("_", map(self.rawValue.unicodeScalars) { "\($0.value)" })
    }
}

/// Curried function to create and layout a view map
func autolayout(viewids: [NSString: UIView])(vertical: Bool, options: NSLayoutFormatOptions)(pin: CalcPart, parts: CalcPart...) {
    
    let vids: [String] = map(enumerate(parts)) { (index, part) in
        return index > 0 ? ("[" + part.viewid + "(" + pin.viewid + ")]") : ("[" + part.viewid + "]")
    }
    
    let fmts = ["|"] + vids + ["|"]
    let format = fmts.reduce(vertical ? "V:" : "H:" , combine: +)
    
    // format will look like: H:|[v52][v53(v67)][v54(v67)][v8722(v67)]|
    NSLog("layout: \(format)")
    
    let constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: nil, views: viewids)
    NSLayoutConstraint.activateConstraints(constraints)
}

func addCalculatorToView(rootView: UIView) {
    rootView.backgroundColor = UIColor.blackColor()
    rootView.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    let display = CalcPartView(type: CalcPart.Display)
    display.text = calcstack.last?.description
    rootView.addSubview(display)
    
    let views = [display] + CalcPart.allButtons.map { type in
        let view = CalcPartView(type: type) {
            display.text = press(type).description
        }
        
        rootView.addSubview(view)
        return view
    }
    
    let viewids = views.reduce(Dictionary<NSString, CalcPartView>(), combine: { (var strviews, view) in
        strviews[NSString(string: view.type.viewid)] = view
        return strviews
    })
    
    let alviews = autolayout(viewids)
    
    let alh = alviews(vertical: false, options: .AlignAllTop | .AlignAllBottom)
    let alv = alviews(vertical: true, options: .AlignAllLeft)
    
    alh(pin: .Display, parts: .Display)
    alh(pin: .Clear, parts: .Clear, .SwapSign, .Percent, .Divide)
    alh(pin: .Clear, parts: .Num7, .Num8, .Num9, .Multiply)
    alh(pin: .Clear, parts: .Num4, .Num5, .Num6, .Minus)
    alh(pin: .Clear, parts: .Num1, .Num2, .Num3, .Plus)
    alh(pin: .Clear, parts: .Num0, .Decimal, .Equal)
    
    alv(pin: .Display, parts: .Display, .Clear, .Num7, .Num4, .Num1, .Num0)
}

let rootView = UIView(frame: CGRect(x:0, y:0, width: 640, height: 1136)) // iPhone 5
addCalculatorToView(rootView)
rootView.layoutIfNeeded()
