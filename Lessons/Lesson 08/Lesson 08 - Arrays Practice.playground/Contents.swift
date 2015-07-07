// Array Practice Homework
// Author: Shiven Ramji

import Foundation

// TODO 1 - Create an Array that contains 4 Integers and assign it to a variable.
var arr = [1,2,3,4]


// TODO 2 - Add another integer to the end of that array.
arr.append(5)

// TODO 3 - Add another integer into the second slot in the array.
arr.insert(6, atIndex:1)

// TODO 4 - Iterate over your Array with a for...in loop and println the elements.
for (index, element) in enumerate(arr) {
    println("Item \(index): \(element)")
}

// TODO 5 - Create an Array of 5 popular dog (or cat) names and assign the array to a variable.
var popnames = ["toshi", "max", "buddy", "charlie", "jack"]

// TODO 6 - Using the variable, get the 3rd name out of the Array.
popnames.removeAtIndex(2)

// TODO 7 - Write a function that accepts an Array of Strings as its first argument and an integer as its second argument. The function should return the number of dog/cat names that have the number of letters indicated by the second argument. (e.g. If the second argument is 5 and you have a name "Toshi", the function should return at least 1.)

func dognameletters(names:[String],letters:Int) -> Int {
    var sum: Int = 0
    
    for (index, element) in enumerate(names){
        
        let length = count(element)
        if (length == letters){
            sum++
        }
    }
    return sum
}

dognameletters(["toshi", "max", "buddy", "charlie", "jack"], 5)


// TODO 8 - Create a class called Human that has two properties, name and age.
class Human {
    var name : String
    var age : Int
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}

// TODO 9 - Create an empty array of Humans.
var humans : [Human] = []

// TODO 10 - Create three humans. Add each one to the end of the Array as you create them.
var h1 = Human(name: "Shiven",age: 34)
humans.append(h1)

var h2 = Human(name: "Aaron",age: 30)
humans.append(h2)

var h3 = Human(name: "Brooke",age: 29)
humans.append(h3)

// TODO 11 - Create an empty String and assign it to a variable. Using a loop, iterate over the Array of Humans, and for each Human, add the Human's name to the String, adding a comma + space between the names. BONUS: Don't put a comma after the last name.
var humanlist: String = ""
for (index,element) in enumerate(humans){
    if (index == humans.count-1){
        humanlist += element.name
    }
    else {
       humanlist += element.name + ", "
    }
}

humanlist

// TODO 12 - Look up the average daily temperatures from the last 30 days recorded in NYC. Compute the average of those temperatures (sum divided by the number of days).
var dailytemps = [83, 80, 82, 87, 86, 88, 78, 87, 88, 89, 85, 85, 88, 81, 83, 87, 90, 88, 95, 88, 96, 94, 93,    92, 89, 92, 86, 88, 97, 92, 89]

var avgtemp: Int

var sumtemp: Int = 0

for (index,element) in enumerate(dailytemps){
    sumtemp = sumtemp + element
}
avgtemp = sumtemp / dailytemps.count

// TODO 13 - Which one of your close friends has the longest first name? Compute it using Arrays, functions, loops, and conditionals.


