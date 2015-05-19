//: Playground - noun: a place where people can play

import Foundation

// Explicit type, empty array
var arr : [String] = []

// Implicit type, empty array
var arr1 = [String]()

// Implicit type, non-empty
var arr2 = ["hello","doctor"]

arr2[0]
arr2[1]

// Error: "Out of bounds"
//arr2[2]

// Get the number of elements in an array
count(arr2)

// Append
arr2.append("name")
arr2

// Concatenate two arrays
arr2 += ["continue","yesterday"]

// Insert an element at the front of an array
arr2.insert("tomorrow", atIndex:0)

// Substitute an element
arr2[0]="discovery"

// Remove an element
arr2.removeAtIndex(2)
arr2

// Iterate over arrays...
var all = ""
for word in arr2 {
    all += word
}

var sum = 0
for (index, word) in enumerate(arr2) {
    sum += index
}
sum

// Sorting using sort(), works for basic types
sort(&arr2) //note the &
arr2

// Better sorting
func alphabetical(a:String, b:String) -> Bool {
    return a < b
}
arr2.sort(alphabetical)


class Dog {
    var name : String
    
    init(name:String) {
        self.name = name
    }
    
    func bark() -> String {
        return "\(self.name) says woof!"
    }
}

var dogs : [Dog] = []

let myDog = Dog(name: "toshi")
dogs.append(myDog)
dogs

dogs[0].name


// Dictionaries

var  constants : [String: Double] = [:]


