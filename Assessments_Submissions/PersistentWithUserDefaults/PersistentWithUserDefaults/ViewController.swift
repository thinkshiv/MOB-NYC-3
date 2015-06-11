//
//  ViewController.swift
//  PersistentWithUserDefaults
//
//  Created by Shiven Ramji on 6/9/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    
    @IBAction func onSaveTapped(sender: AnyObject) {
        self.saveInDefaults()
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.loadFromDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getPropertyListUrl() -> NSURL {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(
            .DocumentDirectory,
            inDomains: .UserDomainMask
        )
        
        let documentsDirectory = urls.first as! NSURL
        
        let myPlist = documentsDirectory.URLByAppendingPathComponent(
            "myFirstPropertyList.plist",
            isDirectory: false
        )
        
        return myPlist
    }
    
    func saveToPList(){
        let dataToSave: NSDictionary = ["textview_contents": self.myTextView.text,"favorite_numbers": [3.14, 2.71, 1.618, 0.0],"age": 34]
        
        dataToSave.writeToURL(self.getPropertyListUrl(), atomically: true)
    }
    
    func readFromPList() {
        let savedData = NSDictionary(contentsOfURL: self.getPropertyListUrl())
        println(savedData)
        
        
    }
    
    
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    func saveInDefaults(){
        let text = self.myTextView.text
        self.defaultsMgr.setValue(text, forKey: "userText")
        
    }
    
    func loadFromDefaults(){
        if let savedText = self.defaultsMgr.valueForKey("userText") as? String {
            self.myTextView.text = savedText
        }
    }


}

