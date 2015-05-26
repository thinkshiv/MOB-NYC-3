import Foundation

// TODO 1 - Create a Dictionary of String to Double containing yesterdays high temperatures for four world cities. Include "London" as one of the cities. Google the temps! Assign the Dictionary to a variable.
var temps: [String:Double] = [:]
temps["london"] = 58.0
temps["new york"] = 53.0
temps["madrid"] = 59.0
temps["tokyo"] = 66.0

// TODO 2 - Using the variable you just created, show how to get yesterday's temperature for London.
temps["london"]

// TODO 3 - Add another city to the Dictionary, "Montreal", and set its high temperature from yesterday into the Dictionary.
temps["montreal"] = 67.0

// TODO 4 - Create a variable called "highTemp". Iterate over the Dictionary with a for-in loop and compute the highest temperature of your chosen cities.
var highTemp: Double
for element in temps{
    
}

// TODO 5 - Create a class called Book. It should have three properties: title, author, and number of pages.

// TODO 6 - Create a Dictionary that contains three books of your choice, using ISBN numbers for its keys and Books for its values.

// TODO 7 - Create a Dictionary of Arrays of Strings. Using that Dictionary (assigned to a variable of course), create a catalog of nouns, verbs, adjectives, and adverbs.

// TODO 8 - Iterate over the Dictionary with a for-in loop and print out how many nouns, verbs, adjectives, and adverbs you have in the catalog.

