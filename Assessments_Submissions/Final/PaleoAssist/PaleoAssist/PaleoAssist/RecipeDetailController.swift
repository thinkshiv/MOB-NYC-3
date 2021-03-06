//
//  RecipeDetailController.swift
//  PaleoAssist
//
//  Created by Shiven Ramji on 7/5/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit


enum RecipeDetailSelection: Int {
    case Ingredients = 0, Steps
}

class RecipeDetailController: UIViewController {
    
    var recipe: Recipe?
    var initialController: RecipeDetailSelection = .Ingredients
    lazy var groceryList = GroceryList()
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    lazy var ingredientsController: RecipeIngredientsController! = {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("RecipeIngredientsController") as? RecipeIngredientsController
        controller?.recipe = self.recipe
        controller?.tableView.contentInset = self.tableInsets
        return controller
        }()
    
    lazy var stepsController: RecipeDirectionsController! = {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("RecipeDirectionsController") as? RecipeDirectionsController
        controller?.recipe = self.recipe
        controller?.tableView.contentInset = self.tableInsets
        return controller
        }()
    
    // don't rely on automaticallyAdjustsScrollViewInsets since we're swapping child controllers
    var tableInsets: UIEdgeInsets {
        var insets = UIEdgeInsetsZero
        if let nav = navigationController {
            insets.top = CGRectGetHeight(nav.navigationBar.bounds)
            insets.top += 20 // status bar
        }
        if let tab = tabBarController {
            insets.bottom = CGRectGetHeight(tab.tabBar.bounds)
        }
        return insets
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load initial selected segment control
        segmentedControl.selectedSegmentIndex = initialController.rawValue
        println("we got here")
        updateSelectedController(initialController)
    }
    
    func onPromptAddMyCart(sender: AnyObject) {
        let name = recipe?.name ?? "this recipe"
        
        let alert = UIAlertController(title: "Grocery List", message: "Do you want to add all of the ingredients for \(name) to your grocery list?", preferredStyle: .Alert)
        // TODO: add all items to grocery list
        alert.addAction(UIAlertAction(title: "Add Items", style: .Default, handler: { _ in
            if let items = self.recipe?.ingredients {
                for item in items {
                    self.groceryList.addItemToList(item)
                }
                self.groceryList.sync()
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func onSegmentChange(sender: UISegmentedControl) {
        if let index = RecipeDetailSelection(rawValue: sender.selectedSegmentIndex) {
            updateSelectedController(index)
        } else {
            println("Unsupported recipe detail selection \(sender.selectedSegmentIndex)")
            abort()
        }
    }
    
    // Function to update the selected controller
    func updateSelectedController(selected: RecipeDetailSelection) {
        switch selected {
        case .Ingredients:
            println("we got to ingredients!")
            addSubViewController(ingredientsController)
            stepsController.removeFromSuperViewController()
            navigationItem.rightBarButtonItem = promptActionButton()
            break
        case .Steps:
            println("we got to steps!")
            addSubViewController(stepsController)
            ingredientsController.removeFromSuperViewController()
            navigationItem.rightBarButtonItem = nil
            break
        }
    }
    
    //Dynamically add the prompt button if Ingredients
    func promptActionButton() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "onPromptAddMyCart:")
    }
    
}


