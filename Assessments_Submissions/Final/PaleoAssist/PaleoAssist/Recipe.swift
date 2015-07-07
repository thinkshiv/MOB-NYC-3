//
//  Recipe.swift
//  PaleoAssist
//
//  Created by Shiven Ramji on 7/5/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import Foundation

public class Recipe {
    
    public let name: String
    public let ingredients: [Ingredient]
    public let steps: [String]
    public let timers: [Int]
    
    public init(name: String, ingredients: [Ingredient], steps: [String], timers: [Int]) {
        self.name = name
        self.ingredients = ingredients
        self.steps = steps
        self.timers = timers
    }
    
}