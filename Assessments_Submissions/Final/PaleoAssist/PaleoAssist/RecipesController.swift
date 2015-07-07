//
//  RecipesController.swift
//  PaleoAssist
//
//  Created by Shiven Ramji on 7/5/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class RecipesController: UITableViewController {
    
    // Initialize the RecipeStore()
    var recipeStore = RecipeStore()
    
    // Load content
    func reloadContent() {
        recipeStore = RecipeStore()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hack for Xcode 6
        navigationController?.tabBarItem.selectedImage = UIImage(named: "bookmark-full")
        
    }
    
    // Pass the selected recipe via segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segue.identifier
        
        if identifier == "RecipeDetailSegue" {
            // pass through the selected recipe
            if let path = tableView.indexPathForSelectedRow() {
                let recipe = recipeStore.recipes[path.row]
                let destination = segue.destinationViewController as! RecipeDetailController
                destination.recipe = recipe
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeStore.recipes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell", forIndexPath: indexPath) as! RecipeCell
        let recipe = recipeStore.recipes[indexPath.row]
        cell.recipeLabel.text = recipe.name
        cell.thumbnailView.image = UIImage(named: recipe.name)
        return cell
    }
    
}


