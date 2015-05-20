//
//  ViewController.swift
//  TaskMaster
//
//  Created by Shiven Ramji on 5/19/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    
    var tasks = ["Buy an Apple Watch","Purchase AppleCare","Sell my iPad"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Table View Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as! UITableViewCell
        let task = self.tasks[indexPath.row]
        cell.textLabel!.text = task
        
        return cell
    }
    
    func insertNewTask(task:String){
        self.tasks.append(task) // remember the data
        
        let indexPath = NSIndexPath(forItem: self.tasks.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "newTaskSegue") {
            let destination = segue.destinationViewController as! NewTaskViewController
            destination.mainViewController = self
        }
        
    }
    


}

