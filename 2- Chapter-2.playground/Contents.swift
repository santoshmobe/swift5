import Cocoa

var str = "Hello, playground"

// Internally, an optional is defined as follows:

//enum Optional<T> {
//    case None
//    case Some(T)
//}

var myString: String? = ""
var myString2: Optional<String>

if let myString = myString, myString == "" {
    print("there is value")
} else {
    print("no value")
}

// Array -> Ordered
// Set -> Unordered of unique values
// Dictonary -> unordered of key value pairs

// data sotred in swift collections must be of same type

var a = ["abc", 2] as [Any]

// AnyObject instance of any class type
// Any instance of any type including function type.

var array = [Int](repeating: 3, count: 7) // array with 7 elements with each element containing the number 3
array.append(4)
array.append(5)
print(array.count)

var arrayOne = [1,2,3,4,5]

let shuffledArray = arrayOne.shuffled()
print(arrayOne)
print(shuffledArray)

var subArray = arrayOne[2...4]
var subArray2 = arrayOne[2..<4]
var subarray3 = arrayOne[..<3]

arrayOne[1...2] = [12,13]
print(arrayOne)

arrayOne[1...3] = [12,13,14,15]
print(arrayOne)

arrayOne.sort(){$0 < $1}
print(arrayOne)

var array2 = arrayOne.sorted(by: >)
print(array2)

let city = ["Boston", "London", "Atlanta"]
let filtered = city.filter({$0.range(of: "o") != nil})

print(filtered)

var mySet = Set<String>()
mySet.insert("One")
mySet.insert("Two")
var results = mySet.insert("One")
if results.inserted {
  print("Success")
} else {
  print("Failed")
}

var mySet1 = Set(["One", "Two", "Three", "abc"])
var mySet2 = Set(["abc","def","ghi", "One"])

var newSet1 = mySet1.union(mySet2)
var newSet2 = mySet1.subtracting(mySet2)
var newSet3 = mySet1.intersection(mySet2)
var newSet4 = mySet1.symmetricDifference(mySet2)

var ran = 0
while ran < 7 {
    ran = Int.random(in: 1...20)
}

repeat {
    ran = Int.random(in: 1..<20)
} while ran < 4

var studentId = 4
var marks = 35

switch marks {
case 20...30:
    print("Fail")
case 30...40:
    print("C")
case 40...50 where studentId == 4:
    print("B")
case 50...100:
    print("A")
default:
    "Quit"
}

// Switch on tuples
let myDog = ("Maple", 4)

switch myDog {
case ("Lily", let age):
    print("Lily age: \(age)")
case ("Maple", let age):
    print("Maple age: \(age)")
default:
    print("unknown")
}

switch myDog {
case (_, 0...1):
    print("Under aged")
case (_, 2...7):
    print("matured")
default:
    print("default")
}

// Match on wild card
let myNumber = 10
switch myNumber {
case _ where myNumber.isMultiple(of: 2):
    print("Multiple of 2")
case _ where myNumber.isMultiple(of: 3):
    print("Multiple of 3")
default:
    print("default")
}

for number in 1...30 where number % 3 == 0 {
    print(number)
}

// Filtering with the for case statement

var worldSeriesWinners = [
("Red", 2014),
("White", 2016),
("Red", 2010)
]

for case let ("Red", year) in worldSeriesWinners {
    print(year)
}

let myNumbers: [Int?] = [1,2,nil,4,nil]

for case let .some(num) in myNumbers {
    print(num)
}

for case let num? in myNumbers where num < 3 {
    print(num)
}

enum Identifier {
    case Name(String)
    case Number(Int)
    case NoIdentifier
}

var playerIdentifier = Identifier.Number(2)
if case let .Number(num) = playerIdentifier, num == 2 {
    print("players id = \(num)")
}

for i in 1...10 {
    if i % 2 == 0 {
        continue
    }
    print("\(i) is odd")
}
