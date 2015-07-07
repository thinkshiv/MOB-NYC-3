//
//  RecipeCell.swift
//  PaleoAssist
//
//  Created by Shiven Ramji on 7/5/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailView.layer.borderWidth = 1 / UIScreen.mainScreen().scale
        thumbnailView.layer.borderColor = UIColor(white: 0.9, alpha: 1).CGColor
    }
    
}
