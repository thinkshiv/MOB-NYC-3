//
//  ViewControllerContainers.swift
//  PaleoAssist
//
//  Created by Shiven Ramji on 7/5/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Code to extend the UIViewController to add the child controller
    func addSubViewController(controller: UIViewController) {
        addChildViewController(controller)
        controller.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(controller.view)
        
        view.addConstraint(NSLayoutConstraint(item: controller.view,
            attribute: .Trailing, relatedBy: .Equal, toItem: view,
            attribute: .Trailing, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: controller.view,
            attribute: .Leading, relatedBy: .Equal, toItem: view,
            attribute: .Leading, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: controller.view,
            attribute: .Top, relatedBy: .Equal, toItem: view,
            attribute: .Top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: controller.view,
            attribute: .Bottom, relatedBy: .Equal, toItem: view,
            attribute: .Bottom, multiplier: 1, constant: 0))
        
        controller.didMoveToParentViewController(self)
    }
    
    func removeFromSuperViewController() {
        willMoveToParentViewController(nil)
        view.removeFromSuperview()
        removeFromParentViewController()
    }
    
}
