// Enumerations

enum ConversionMode {
    case ImperialToMetric
    case MetricToImperial
}

var currentMode : ConversionMode = .ImperialToMetric
currentMode == .ImperialToMetric
currentMode == .MetricToImperial

enum Units {
    case Feet
    case Meters
    case Ounces
    case Grams
    case Miles
    case Kilometers
}

func isMetric(units:Units) ->Bool {
    switch units {
    case .Feet:
        return false
    case .Meters:
        return true
    default:
        return false
    }
    
}


//Tuples

let exampleTuple : (Double, Bool) = (12.0, false)
exampleTuple.0
exampleTuple.1

var unitsTuple : (Units:Units, isMetric:Bool) = (units:.Feet, isMetric: false)

unitsTuple.Units
unitsTuple.isMetric

func divide(x:Int, y:Int) -> (answer:Int, remainder:Int) {
    let answer = x / y
    let remainder = x % y
    return (answer:answer, remainder:remainder)
}

let sample = divide(100, 33)
sample.answer
sample.remainder

/*

enum Digit {
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
TEST(myCALC, 3.0, (left:[.one], op:)
*/

enum Digit {
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
TEST(myCALC, (3.0, op:[.Add], 2.0)