//
//  ModalViewController.swift
//  DismissModal
//
//  Created by Shiven Ramji on 5/14/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func OnDismissTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        let myDog = Dog(name: myTextField.text)
        let controller = self.presentingViewController as! UINavigationController
        let masterViewController = controller.viewControllers[0] as! MasterViewController
        masterViewController.insertNewObject(myDog)
        
        

//        controller.objects.append(myDog)
        
    }
    
    
    //@IBOutlet var myTextField: [UITextField]!
    /*@IBAction func onDismissTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        let newLabelText = self.myTextField.description
        let label = (self.presentedViewController as! ViewController).myLabel
        label.text = newLabelText
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
