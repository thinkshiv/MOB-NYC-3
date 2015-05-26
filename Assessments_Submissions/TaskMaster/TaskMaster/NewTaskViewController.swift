//
//  NewTaskViewController.swift
//  TaskMaster
//
//  Created by Shiven Ramji on 5/19/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController, UITableViewDelegate {

    var mainViewController : ViewController!
    @IBOutlet var newTaskTitle: UITextField!
    @IBOutlet var newTaskDescription: UITextView!
    
    
    @IBAction func cancel(){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func done(){
        
    let title = self.newTaskTitle.text
    let desc = self.newTaskDescription.text
    
    let newtask = Task(title:title, description:desc)
    
    
    //Add to tableView
    
    self.mainViewController.insertNewTask(newtask)
    self.dismissViewControllerAnimated(true, completion: nil)
    
    }
}
