import Cocoa

var str = "Hello, playground"

// variadic parameters
func sayHello(greeting: String, names: String...) {
    for name in names {
        print("\(greeting) \(name)")
    }
}

sayHello(greeting: "Hello", names: "Wax", "Rax")

func reverse(first: inout String, second: inout String) {
    let temp = first
    first = second
    second = temp
}

// In out
var one = "One"
var two = "Two"
reverse(first: &one, second: &two)
print("one = \(one) two = \(two)")

// Summary

func isValidOctate(octet: String) -> Bool {
    guard let num = Int(octet), num >= 0 && num < 255 else {
        return false
    }
    return true
}

func isValidIpAddress(ippAddr: String) -> Bool {
    let octets = ippAddr.split(separator: ".").map{String($0)}
    guard octets.count == 4 else {
        return false
    }
    for octet in octets {
        guard isValidOctate(octet: octet) else {
            return false
        }
    }
    return true
}
isValidIpAddress(ippAddr: "192.168.10.1")

// Structs and Classes
// Similarities
// 1) Property 2) Methods 3) Initializers 4) Subscripts 5) Extensions
// Differences
// Type: Structure is value type and class is reference type
// Inheritence: Structs can not inherit
// Deinitializers: Structs can not have custom deinitializer

class Plant {
    var height = 0.0
    var age = 0
    
    func growHeight(inches: Double) {
        self.height += inches
    }
    
    func getDetails() -> String {
        return "Plant details"
    }
}

class Tree: Plant {
    private var limbs = 0
    
    func limbGrow() {
        self.limbs += 1
    }
    
    func  limbFall() {
        self.limbs -= 1
    }
    
    override func getDetails() -> String {
        return super.getDetails() + " \(limbs)"
    }
}

let tree = Tree()
let plant = Plant()
let plant2:Plant = Tree()
plant.getDetails()
tree.getDetails()
plant2.getDetails()

// Protocol
protocol FullName {
    var firstName: String { get set }
    var lastName: String { get set }
    func getFullName() -> String
}

class Scientist: FullName {
    var firstName: String = ""
    var lastName: String = ""
    var field = ""
    
    func getFullName() -> String {
        return "\(firstName) \(lastName) studies field \(field)"
    }
}

class FootballPlayer: FullName {
    var firstName: String = ""
    var lastName: String = ""
    var number = 0
    
    func getFullName() -> String {
        return "\(firstName) \(lastName) has number \(number)"
    }
}

var scientist = Scientist()
scientist.firstName = "Kara"
scientist.lastName = "Hoffman"
scientist.field = "Physics"

var footballPlayer = FootballPlayer()
footballPlayer.firstName = "Leonan"
footballPlayer.lastName  = "Messi"
footballPlayer.number = 10

var person: FullName
person = scientist
print(person.getFullName())
person = footballPlayer
print(person.getFullName())


protocol TextValidating {
    var regExFindMatchingString: String { get }
    var validationMessage: String { get }
}

extension TextValidating {
    
    var regExMatchingString: String {
        return regExFindMatchingString + "$"
    }
    
    func validateString(str: String) -> Bool {
           if let _ = str.range(of: regExMatchingString, options: .regularExpression) {
               return true
           } else {
               return false
           }
       }
       
       func getMatchingString(str: String) -> String? {
           if let newMatch = str.range(of: regExFindMatchingString, options: .regularExpression) {
               return String(str[newMatch])
           } else {
               return nil
           }
       }
    
}

struct AlphaValidation: TextValidating {
    static let sharedInstance = AlphaValidation()
    private init() {}
    var regExFindMatchingString: String = "^[a-zA-z]{0,10}"
    var validationMessage: String = "Can only contain alpha characters"
}

struct AlphaNumericValidation: TextValidating {
    static let sharedInstance = AlphaNumericValidation()
    private init() {}
    var regExFindMatchingString: String = "^[a-zA-Z0-9]{0,15}"
    var validationMessage: String = "Can only contain alpha numeric characters"
}

AlphaValidation.sharedInstance.validateString(str: "^")

// Object oriented design
class Animal {
    fileprivate var landAnimal = false
    fileprivate var landAttack = false
    fileprivate var landMovement = false
 
    fileprivate var seaAnimal = false
    fileprivate var seaAttack = false
    fileprivate var seaMovement = false
 
    fileprivate var airAnimal = false
    fileprivate var airAttack = false
    fileprivate var airMovement = false
 
    fileprivate var hitPoints = 0
    
    init() {
    landAnimal = false
    landAttack = false
    landMovement = false
    airAnimal = false
    airAttack = false
    airMovement = false
    seaAnimal = false
    seaAttack = false
    seaMovement = false
    hitPoints = 0
    }
    
    func isLandAnimal() -> Bool {
        return landAnimal
    }
    func canLandAttack() -> Bool {
        return landAttack
    }
    func canLandMove() -> Bool {
        return landMovement
    }
    func isSeaAnimal() -> Bool {
        return seaAnimal
    }
    func canSeaAttack() -> Bool {
        return seaAttack
    }
    func canSeaMove() -> Bool {
        return seaMovement
    }
    
    func isAirAnimal() -> Bool {
        return airAnimal
    }
    func canAirAttack() -> Bool {
        return airAttack
    }
    func canAirMove() -> Bool {
        return airMovement
    }
    func doLandAttack() {}
    func doLandMovement() {}
    func doSeaAttack() {}
    func doSeaMovement() {}
    func doAirAttack() {}
    func doAirMovement() {}
    func takeHit(amount: Int) {
     hitPoints -= amount
    }
    func hitPointsRemaining() -> Int {
        return hitPoints
    }
    func isAlive() -> Bool {
        return hitPoints > 0 ? true : false
    }
}

class Lion: Animal {
    override init() {
        super.init()
        landAnimal = true
        landAttack = true
        landMovement = true
        hitPoints = 20
    }
    override func doLandAttack() {
        print("Lion Attack")
    }
    override func doLandMovement() {
        print("Lion Move")
    }
}
 
class Alligator: Animal {
    override init() {
        super.init()
        landAnimal = true
        landAttack = true
        landMovement = true
        seaAnimal = true
        seaAttack = true
        seaMovement = true
        hitPoints = 35
    }
    override func doLandAttack() {
        print("Alligator Land Attack")
    }
    override func doLandMovement() {
        print("Alligator Land Move")
    }
    override func doSeaAttack() {
        print("Alligator Sea Attack")
    }
    override func doSeaMovement() {
        print("Alligator Sea Move")
    }
 
}

var animals = [Animal]()
animals.append(Alligator())
animals.append(Alligator())
animals.append(Lion())
 
for (index, animal) in animals.enumerated() {
    if animal.isAirAnimal() {
        print("Animal at \(index) is Air")
    }
    if animal.isLandAnimal() {
        print("Animal at \(index) is Land")
    }
    if animal.isSeaAnimal() {
        print("Animal at \(index) is Sea")
    }
}

// Disadvantages
// 1) large monolithic super class (because a class can have only on super class)
// 2) not being able to define constants on superclass tha the subclasses can set
// 3) use of flags can be mistake


protocol Animal1 {
    var hitPoints: Int { get set }
}

extension Animal1 {
    mutating func takeHit(amount: Int) {
        hitPoints -= amount
}
    func hitPointsRemaining() -> Int {
        return hitPoints
}
    func isAlive() -> Bool {
        return hitPoints > 0 ? true : false
    }
}

protocol LandAnimal: Animal1 {
    var landAttack: Bool { get }
    var landMovement: Bool { get }
 
    func doLandAttack()
    func doLandMovement()
}
 
protocol SeaAnimal: Animal1 {
    var seaAttack: Bool { get }
    var seaMovement: Bool { get }
 
    func doSeaAttack()
    func doSeaMovement()
}
 
protocol AirAnimal: Animal1 {
    var airAttack: Bool { get }
    var airMovement: Bool { get }
 
    func doAirAttack()
    func doAirMovement()
}

struct Lion1: LandAnimal {
    var hitPoints = 20
    let landAttack = true
    let landMovement = true
 
    func doLandAttack() {
        print("Lion Attack")
}
    func doLandMovement() {
        print("Lion Move")
    }
}
 
struct Alligator1: LandAnimal, SeaAnimal {
    var hitPoints = 35
    let landAttack = true
    let landMovement = true
    let seaAttack = true
    let seaMovement = true
 
    func doLandAttack() {
        print("Alligator Land Attack")
    }
    func doLandMovement() {
        print("Alligator Land Move")
    }
    func doSeaAttack() {
        print("Alligator Sea Attack")
    }
    func doSeaMovement() {
        print("Alligator Sea Move")
    }
}

/**
 Struct vs Classes
 Value type do not incur the additional overhead for reference counting that referene type incur
 value types are stored in stack which provides better perfomance as compared to reference types which are stored on the heap
 Copying value is relatively cheap in swift
 In swift standard library, Apple has implemented copy-on-write behaviour to reduce the overhead of copying large value types
 Value types are also a lot safer (multithreaded and memory management)
 */
