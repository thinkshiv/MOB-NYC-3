//
//  Conversion.swift
//  UniConverter
//
//  Created by Shiven Ramji on 5/21/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import Foundation

class Conversion{
    var imperialUnits : String = ""
    var metricUnits : String = ""
    
    init(){
        
    }
    
    func convert(imperial:Double) -> Double {
        return 0.0
    }
}

class FahrenheitToCelsius : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "F"
        self.metricUnits = "C"
    }
    override func convert(imperial: Double) -> Double {
        let F = imperial
        let C = 5.0 * (F - 32.0) / 9.0
        return C
    }
}

class MilesToKilometers : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "M"
        self.metricUnits = "km"
    }
    
    override func convert(imperial: Double) -> Double {
        let M = imperial
        let K = M * 1.60934
        return K
    }
}

class PoundsToKilos : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "lbs"
        self.metricUnits = "kg"
    }
    
    override func convert(imperial: Double) -> Double {
        let P = imperial
        let K = P * 0.453592
        return K
    }
}

class InchesToCm : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "in"
        self.metricUnits = "cm"
    }
    
    override func convert(imperial: Double) -> Double {
        let IN = imperial
        let CM = IN * 2.54
        return CM
    }
}
