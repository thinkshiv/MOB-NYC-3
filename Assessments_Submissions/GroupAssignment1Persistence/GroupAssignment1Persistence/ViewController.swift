//
//  ViewController.swift
//  GroupAssignment1Persistence
//
//  Created by Shiven Ramji on 6/9/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextField!
    
    @IBOutlet weak var myTextBlock: UITextView!
    @IBAction func onSaveTapped(sender: AnyObject) {
        self.saveInDefaults()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    func saveInDefaults(){
        let athletes = ["Michael Jordan", "Steph Curry", "Tiger Woods"]
        //self.myTextView.text
        athletes.append("\(self.myTextView.text)")
        self.defaultsMgr.setValue(athletes, forKey: "userText")
        println(athletes)
        
    }
    
    func loadFromDefaults(){
        if let savedText = self.defaultsMgr.valueForKey("userText") as? [String] {
            for index in enum savedText{
                self.myTextBlock.text += savedText
            }
            
        }
        else
        {
            
        }
    }
}

