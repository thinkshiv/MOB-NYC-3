//: Playground - noun: a place where people can play

import UIKit

class Dog {
    var yearBorn : Int?
    
    var age : Int? {
        
        // GETTER!
        // Used for the "object.prop" syntax
        get{
            if let _yearBorn = self.yearBorn{
                return 2015 - _yearBorn
            } else {
                //self.yearBorn was nil!
                return nil
            }
        }
        
        // SETTER
        // Used for the "object.prop = ..." syntax
        set (newAge){
            self.yearBorn = 2015 - newAge!
        }
    }
}

