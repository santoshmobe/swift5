import Cocoa

var str = "Hello, playground"
var image = NSImage(named: "image.jpg")

//Graph

var j = 1
for i in 1...5 {
    j += i
}

/**
 The myAdd  function will take two integers, add them together and return the sum
 
 - parameter first: The first integer to add
 - parameter second: The second integer to add
 - returns: The sum of the two integers
 - throws: Our errors
 */
func myAdd(first: Int, second: Int) -> Int {
    // Add two integers together
    let sum: Int = first + second
    return sum
}

myAdd(first: 5, second: 10)

let a = pow(Double(2), Double(16))/2

var z = 95
var b = 0b10111111
var c = 0o137
var d = 0x5f

let speedOfLightKmSec = 300_000

let number = 4
 
if number % 2 == 0 {
    print("Even")
} else {
    print("Odd")
}

if number.isMultiple(of: 2) {
    print("In swift 5")
}
