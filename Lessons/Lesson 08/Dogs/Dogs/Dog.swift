//
//  Dog.swift
//  Dogs
//
//  Created by Shiven Ramji on 5/14/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import Foundation

class Dog {
    var name : String
    
    init(name:String) {
        self.name = name
    }
    
    func bark() -> String {
        return "\(self.name) says woof!"
    }
}
