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

/* Methods */
// To override a method/property in a class, it must be marked with the `override` keyword
// A method can be marked final to prevent subclasses from overriding it
// Classes can be marked final, which basically means no subclasses

// Both types and instances can have methods/properties
// Double is a struct

var d: Double = -32.5
if d.isSignMinus {
    d = Double.abs(d)
}
// isSignMinus is an instance property of a Double (You send it to a particular Double)
// abs is a type method of Double (You send it to the type itself)

// to declare a type method or property you use the `static` prefix (of `class` in a class)
// for example:
//static func abs(d: Double) -> Double


// Parameter names
// replace external with _ to not use an external parameter name
// use #output: to require the named parameter be used when calling the function
// It is not required to specify the first argument by default (_ is the default external name), except for init methods!
// By default the 2nd+ parameter names must be used when calling
// Doing something like func(first: Int, _ second: Int) is bad Swift style
// Using the _ is usually bad style, although there are exceptions

func tester(external output: String) {
    print(output)
}
tester(external: "Test")

// Properties
// Property Observers
// Useful for updating the UI whenever a property changes
// This is useful if you want to do something whenever a property is set:
var someStoredProperty: Int = 42 {
    // willSet is called right before the property is set
    willSet { newValue }
    // didSet is called right after the property is set
    didSet { oldValue }
}

// This could be used in a class, to take action when an inherited property is set:
/*
override var inheritedProperty {
    willSet { newValue }
    didSet { oldValue }
}
*/

// Lazy Initialization
// The lazy keyword specifies that the property doesn't get initialized until someone accesses it
// You can allocate an object, execute a closure, or call a method
/*
lazy var testLazy: Int = { return 5*5 }()
// shorthand
lazy var testLazy = { 5*5 }
lazy var testLazy = self.initializeMyProperty()
lazy var testLazy = CalculatorBrain()
testLazy
*/

// lazy satisfies the requirement that all properties must be initialized

// only var can be used with `lazy`, let/constants aren't allowed
// constants/let must be initialized in the initializer
// lazy is useful to get around initinialization dependencies


/* Initialization */
// An init is not commonly needed, since most properties can be set to a default value using =
// Optionals can be defaulted to = nil
// A property can be initialized using a closure as well, ie: = { }()
// lazy evalutation is another alternative
// An init method is only needed when a property can't be set using one of the following

// You get an init() method for free if all properties in a base class (not superclass) have defaults
// If a struct has no initializers, it gets an init() method automatically with all the properties as arguments

// What can you do in an init?
// You can set let/constant properties (if they haven't already been set)
// you can call other init methods in the class using self.init()
// in a class you can call super.init() to call the superclasses initializer
// lots of rules to call other inits

// What are you required to do inside an init?
// By the time init is done, every property must have a value (Optionals can have the value nil)
// There are two kinds of inits in a class - `convenience` and designated (i.e. not convenience)
// convenience inits are prefixed with the `convenience` keyword, all other inits are designated
// a designated init has to (and can only) call a designated init that is in it's immediate superclass
// you must initialize all properties introduced by your class before calling a superclass's init
// you must call a superclass's init before you assign a value to an inherited property
// a convenience initializer must (and can only) call a designated init in it's own class
// a convenience init may call a designated init indirectly (by calling another convenience init)
// a convenience init must call a designated init before it can set any property values
// the calling of other inits must be complete before you can access properties of invoke methods (hence the lazy operator)

// Inheriting init
// if you do not implement ANY designated inits, you inherit all of the superclass's designated inits
// if you override ALL of your superclasses designated inits, you inherit all of it's convenience inits
// if you implement no inits, you inherit all of the superclass's inits
// Any inherited inits help satisy the requirements listed above

// required init
// required init { }
// this means any subclass MUST implement the init methods (though they can be inherited per the rules above)

// Failable init
// An init declared with a ? or ! after the word init returns an Optionals
// failable inits are rare, the compiler will warn you about the type so they are easy to spot

/*
init?(arg1: Int) {
    if arg1 > 0 {
        return arg1
    } else {
        return nil
    }
}

let image = UIImage(named: "foo") // image is an Optional UIImage (ie UIImage?)
// usually you would use if-let for these cases:
if let image = UIImage(named: "foo") {
    // image was created
} else {
    // unable to create the image
}
*/


/* Creating Objects */
//let x = CalculatorBrain()
//let x = CalculatorBrain(arg1: 1, arg2: 2)
//let y = [String]()

// Sometimes objects are created by calling type methods in classes
//let button = UIButton.buttonWithType(UIButtonType.System)
// this style of code is going away in favor of UIButton(type: ...)

// some objects create other objects for you
// let csv: String = ",".join(myArray)


/* AnyObject */
// AnyObject is a special "type" (actually a protocal)
// Used primarily for compatibility with objective-c APIs
// AnyObject is a pointer to an unknown class
// You may see it on properties (toolbar items)
// var toolbarItems: [AnyObject]
// or as arguments to functions (examples are from UIViewController)
// func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject)
// func addConstraints(constraints: [AnyObject])
// or return types from functions
// class func buttonWithType(buttonType: UIButtonType) -> AnyObject { ... }

// To use AnyObject:
// we usually convert it to a type we know. We don't usually use it directly.
// How to convert it:
// We create a new variable of a known object type, and assign what is held as an AnyObject type to it
// obviously the types must be compatible

// Safely casting AnyObject
// var destinationViewController: AnyObject
// let calcVC = destinationViewController as CalculatorViewController
// the above would crash if destVC was not a CalculatorViewController or, a subclass of it

// To protect against a crash you can use if let with as?
// if let calcVC = destinationViewController as? CalculatorViewController { do something with calcVS ... }
// as? returns an optional, calcVC will be nil if destVC is not a CalculatorViewController (or subclass)

// You can also check beforehand (although as/as? is more common and shorter):
// if destinationViewController is CalculatorViewController { let calcVS = ... }

// Casting Array of AnyObject
// var toolbarItems: [AnyObject]
/*
for item in toolbarItems {
    if let toolbarItem = item as? UIBarButtonItem {
        // do something with toolbarItem, we know it's a UIBarButtonItem
    }
}
// or
for toolbarItem in toolbarItems as [UIBarButtonItem]
// this will cast the entire Array, only use if you are sure all the items are of the same type (no using as? here)
*/

// it's also possible to cast inline:
//var button = UIButton.buttonWithType(UIButtonType.System)
//(button as UIButton).currentTitle
// this would crash if we had the wrong type

// Casting is not limited to AnyObject, you can use as/as?/is with any types that make sense
// let vc: UIViewController = CalculatorViewController()
// type of vc is UIViewController (because we explicitly typed it)
// assignment is legal since CalculatorViewController is a UIViewController
// however, we can't say vc.enter() (enter() is from the CalculatorViewController class)
/*
if let calcVC = vc as? CalculatorViewController {
    calcVC.enter() // this works now
}
*/


/* Array Functions */
// Adding arrays
// += [T] (+= joins two arrays, doing += T doesn't work)
// first -> T?  // returns Optional (for out of bounds index/empty array)
// last -> T? // returns Optional (for out of bounds index/empty array)

// var a = [a, b, c]  // assume same type
// append(T)
// insert(T, atIndex: Int) // a.insert(d, atIndex: 1), a = [a, d, b, c]
// splice(Array<T>, atIndex: Int) // a.splice([d, e], atIndex: 1), a = [a, d, e, b, c]
// removeAtIndex(Int) // a.removeAtIndex(1)
// removeRange(Range) // a.removeRange(1..>3)
// replaceRange(1...3, with: [T]) // range doesn't have to be the same length of what it's replacing
// sort(isOrderBefore: (T, T) -> Bool // a.sort({ $0 < $1})

// filter - the function returns false if the element is undesirable
// filter(includeElement: (T) -> Bool) -> T // a.filter({ $0 >= "b" })

// map creates a new array by transforming each element to something different.  The new thing doesn't have to be the same type
// map(transform: (T) -> U) -> [U]
let stringified: [String] = [1, 2, 3].map( {"\($0)"} )

// reduce
// reduce(initial: U, combine(U, T) -> U) -> U
let sum: Int = [1, 2, 3].reduce(0, combine: { $0 + $1 })

/* String */
// String.Index
// You can't index a String with an Int.  This is because multiple Characters can be used to create a Glyph, and you wouldn't be getting a correct representation of the text stored.
// advance() returns an index, advanced by Glyphs not Characters!
// advance() is the key function to working with substrings
var testString = "This is a test"
let startIndex = advance(testString.startIndex, 3)
let endIndex = advance(testString.startIndex, 5)
// todo: this doesn't work, need to investigate why.  Probably a language change?
// print(testString.splice("Hello", startIndex))
// Notice using the [Range] syntax doesn't take two Ints, it takes two String.Indexes)
print(testString[startIndex...endIndex])


// rangeOfString() returns an Optional Range<String.Index>
let num = "56.25"
if let decimalRange = num.rangeOfString(".") {
    let wholeNumberPart = num[num.startIndex..<decimalRange.startIndex]
    var s = "56.25"
    s.removeRange(s.startIndex..<decimalRange.startIndex)
    print(wholeNumberPart)
}


// Type conversion / casting

let d1: Double = 5.52
let f: Float = 5.2
let x = Int(d1) // truncate / floor
let xd = Double(x)
let cfg = CGFloat(d) // explained later in the class
let a2 = Array(arrayLiteral: "Create a string array")

let s = String(["a", "b", "c"]) // Array is of Character, not string

let s2 = String(52.5)
let s3 = "\(52.5)"

/* Assertions */
// Debugging Aid
// assert(() -> Bool, "message")
// the assert function is an `autoclosure` so it doesn't require { }
// assert(1 == 2, "Oh no, 1 is not equal to 2")
// asserts are ignored when compiling for the app store
