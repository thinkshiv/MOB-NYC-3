//
//  EditTaskViewController.swift
//  TaskMaster
//
//  Created by Shiven Ramji on 5/20/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController, UITableViewDelegate {
    
    var mainViewController : ViewController!
    @IBOutlet var editTaskTitle: UITextField!
    @IBOutlet var editTaskDescription: UITextView!
    
    var tasks: [Task] = []
    
    @IBAction func cancel(){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func done(){
        
        let title = self.editTaskTitle.text
        let desc = self.editTaskDescription.text
        
        let newtask = Task(title:title, description:desc)
        
        
        //Add to tableView
        
        self.mainViewController.insertNewTask(newtask)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTaskTitle.text = tasks[0].title
        editTaskDescription.text = tasks[0].description
    }
}
