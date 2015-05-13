//
//  ViewController.swift
//  Lesson07_InClass
//
//  Created by Shiven Ramji on 5/12/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var textFromTextField: UITextField!
    @IBAction func myButton(sender: UIButton) {
        myLabel.text="hello \(textFromTextField.text)!"
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

