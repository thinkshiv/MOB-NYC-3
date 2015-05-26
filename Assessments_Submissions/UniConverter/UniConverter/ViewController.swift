//
//  ViewController.swift
//  UniConverter
//
//  Created by Shiven Ramji on 5/21/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var inputValue : String = ""
    var outputValue : String = ""
    
    @IBOutlet weak var inputValueLabel: UILabel!
    @IBOutlet weak var outputValueLabel: UILabel!
    @IBOutlet weak var outputUnitsLabel: UILabel!
    @IBOutlet weak var inputUnitsLabel: UILabel!
    
    @IBAction func onButtonPressed(sender:UIButton){
        // Get the text label from the UIButton
        let buttonText = sender.titleLabel!.text!
        //println(buttonText)
        // if C:
        if buttonText == "C" {
            // Clear the input value
            self.clearInputValue()
        }
        else{ // 0-9 or the dot:
           self.inputValue += buttonText
        }
        
        println(self.inputValue)
        // if 0-9 or the dot:
        //   Add it to the "input value"
        // if C:
        //   clear the input value
        
        // Update the input value's UILabel
        self.inputValueLabel.text = self.inputValue
        
    }
    
    func convertAndDisplay(converter: Conversion){
        let outputValue = converter.convert(valueToConvert)
        //        println(outputValue)
        
        // Update the output value label
        self.outputValueLabel.text = "\(outputValue)"
        
        // Update the input and output units labels
        self.inputUnitsLabel.text = converter.imperialUnits
        self.outputUnitsLabel.text = converter.metricUnits
        
        self.clearInputValue()
    }
    
    func clearInputValue(){
        self.inputValue = ""
        self.outputValue = ""
    }
    
    var valueToConvert : Double {
        return NSString(string: self.inputValue).doubleValue
    }
    
    @IBAction func convertFtoC(sender: AnyObject) {
        
       convertAndDisplay(FahrenheitToCelsius())
    }
    
    
    @IBAction func convertMtoKm(sender: AnyObject) {
        // Get the inputValue and convert to a Double
        convertAndDisplay(MilesToKilometers())
        
    }
    
    
    @IBAction func convertLbsToKg(sender: AnyObject) {
        convertAndDisplay(PoundsToKilos())
    }
    
    
    @IBAction func convertInToCm(sender: AnyObject) {
        // Get the inputValue and convert to a Double
        convertAndDisplay(InchesToCm())
        
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

