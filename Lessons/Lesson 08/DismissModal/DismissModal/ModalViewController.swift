//
//  ModalViewController.swift
//  DismissModal
//
<<<<<<< HEAD
<<<<<<< HEAD
//  Created by Shiven Ramji on 5/14/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
=======
//  Created by William Martin on 5/14/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
>>>>>>> ga-students/master
=======
//  Created by William Martin on 5/14/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
>>>>>>> ga-students/master
//

import UIKit

class ModalViewController: UIViewController {
<<<<<<< HEAD
<<<<<<< HEAD

=======
=======
>>>>>>> ga-students/master
    @IBOutlet weak var myTextField: UITextField!

    @IBAction func onDismissTapped(sender: AnyObject) {
        // Get the text from the text field.
        let newLabelText = self.myTextField.text
        
        // Get a reference to the view controller we came from
        // with the correct type.
        let myViewController = self.presentingViewController as! ViewController
        
        // Get a reference to the IBOutlet-referenced UILabel 
        // in the other View Controller.
        let theTextLabel = myViewController.myLabel
        
        // Set the text of that label to the new text from the text field.
        theTextLabel.text = newLabelText
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
<<<<<<< HEAD
>>>>>>> ga-students/master
=======
>>>>>>> ga-students/master
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

<<<<<<< HEAD
<<<<<<< HEAD
    @IBOutlet var myTextField: [UITextField]!
    @IBAction func onDismissTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        let newLabelText = self.myTextField.description
        let label = (self.presentedViewController as! ViewController).myLabel
        label.text = newLabelText
    }
=======
>>>>>>> ga-students/master
=======
>>>>>>> ga-students/master
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
