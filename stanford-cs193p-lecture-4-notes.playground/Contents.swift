//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/* Optional and Enum */
// An optional is just an enum


/* Array */
//var a = Array<String>()
// same as:
var a = [String]()

var animals = ["Pony", "Alpaca"]

for animal in animals {
    print(animal)
}

/* Dictionary */

//var dict = Dictionary<String, Int>()
// same as:
var dict = [String:Int]()
dict = ["Five": 5, "Seven": 7]

for (key, value) in dict {
    print("\(key)=\(value)")
}

// accessing with square brackets returns an optional, must unwrap
print(dict["Five"]!)


/* Range */
// A range is just two end points of a sensible point
// Range is generc (Range<T>)
// An Array's Range is Range<Int> (since Arrays are indexed by Int)
// Warning - a String's Range is not Range<Int> as you would expect, it is Range<String.Index>
var rangeArray = ["This", "is", "a", "test"]
print("\(rangeArray[0...1])")

// Range is enumeratable
for i in [0...20] {
    print("\(i)")
}


/* NSObject */
// NSObject was the base class for all objective-c classes
// Some features will require that we subclass NSObject in our Swift code (and it can't hurt to do so)


/* NSNumber */
// Generic number holding class
let myNum: NSNumber = NSNumber(double: 5.5)
print(myNum.intValue)
// Not used much in swift, and types are bridged so it's rarely used (NSNumberFormatter is a use)


/* NSDate */
var rightMeow = NSDate()
print(rightMeow)
// see also: NSCalendar, NSDateFormatter, NSDateComponents
// Look at all the classes documentation when displaying dates - there are localization ramifications


/* NSData */
// "bag o' bits" - untyped/raw data
// Used to save/restore/transmit raw data throughout the iOS SDK



/* Data Structures */
class testClass {
    //<#properties and methods#>
}

struct testStruct {
    //<#properties and methods#>
}

enum testEnum {
    // computed properties and functions
    
}

// class is a reference type (stored in the heap, passed as a pointer)
// struct and enum are value types (copied when passed)
// You must not any func that can mutate a struct/enum with the keyword mutating


// constant pointers to a class (let) can still mutate it by calling methods and changing properties


// Which to use?
// Usually you will use class over struct - for inheritance, etc (this is an object-oriented language)
// struct is more for fundamental types
// enum use is situational - any time you have a type of data with discrete values

// methods
