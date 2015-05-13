//
//  ViewController.swift
//  Lesson07_InClass
//
//  Created by Shiven Ramji on 5/12/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class SumViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var txtField1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func myButton(sender: AnyObject) {
        if NSScanner(string: txtField1.text).scanDecimal(nil) && NSScanner(string: txtField1.text).atEnd == true {
            myLabel.text=(NSString(string: txtField1.text).doubleValue + NSString(string: txtField2.text).doubleValue).description
        }
        else{
            myLabel.text="Not a number"
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

