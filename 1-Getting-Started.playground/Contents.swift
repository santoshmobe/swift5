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

var stringOne = "one to three";
var stringTwo = stringOne.replacingOccurrences(of: "to", with: "two")
print(stringTwo)

var path = "/one/two/three/four"
let startIndex = path.index(path.startIndex, offsetBy: 4)
let endIndex = path.index(path.startIndex, offsetBy: 14)

let sPath = path[startIndex ..< endIndex]

let newStr = String(sPath)

path[..<startIndex]
path[endIndex...]

path.last
path.first

let startIndexOffsetByLastIndex = path.index(path.endIndex, offsetBy: -4)
let endIndexOffsetByLastIndex = path.index(path.endIndex, offsetBy: -14)

let spath2 = path[endIndexOffsetByLastIndex ..< startIndexOffsetByLastIndex]

var team = ("Boston", "Red Sox", 97, 65, 59.9)
var (city, name, wins, losses, percent) = team

var team2 = (city: "Kathmandu", name: "Wit mm", wins: 45, losses: 12, percent: 45)

enum Product {
    case Book(Double, Int, Int)
    case Puzzle(Double, Int)
}

var masterSwift = Product.Book(49.99, 2017, 310)
var worldPuzzle = Product.Puzzle(9.99, 200)

switch masterSwift {
case .Book(let price, let year, let pages):
    print("Masteing swift was published in \(year) for the price \(price) and has \(pages) pages")
case .Puzzle(let price, let pieces):
    print("Mastering swift is a puzzle with pieces with \(pieces) and sells for \(price)")
}

// Combined assignement operator
var x = 6
x += 2
x -= 2
x *= 2
x /= 2

// Closed range operator
for i in 1...3 {
    print(#"Number "\#(i)""#)
}

// Half open range operator
for i in 1..<3 {
    print(#"Number "\#(i)""#)
}
