//
//  Task.swift
//  TaskMaster
//
//  Created by Shiven Ramji on 5/20/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import Foundation

class Task {
    var title : String
    var datecreated : NSDate
    var datedue : NSDate
    var description : String
    
    
    init(title:String) {
        self.title = title
    }
    
    
    func bark() -> String {
        return "\(self.name) says woof!"
    }
}