//
//  Conversion.swift
//  UnitConverter
//
//  Created by William Martin on 5/21/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import Foundation

class Conversion {
    var imperialUnits : String = ""
    var metricUnits : String = ""
    
    init() {
        
    }
    
    func convert(imperial:Double) -> Double {
        return 0.0
    }
}


class FahrenheitToCelsius : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "°F"
        self.metricUnits = "°C"
    }
    
    override func convert(imperial: Double) -> Double {
        let F = imperial
        let C = 5.0 * (F - 32.0) / 9.0
        return C
    }
}


class MilesToKilometers : Conversion {
    // Put your conversion here!
    override init() {
        super.init()
        self.imperialUnits = "mi"
        self.metricUnits = "km"
    }
    
    override func convert(imperial: Double) -> Double {
        let miles = imperial
        let km = miles * 1.609344
        return km
    }
}


class PoundsToKilograms : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "lbs"
        self.metricUnits = "kg"
    }
    
    override func convert(imperial: Double) -> Double {
        let pounds = imperial
        let kg = imperial * 0.453592
        return kg
    }
}


class InchesToCentimeters : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "in"
        self.metricUnits = "cm"
    }
    
    override func convert(imperial: Double) -> Double {
        let inches = imperial
        let cm = imperial * 2.54
        return cm
    }
}














