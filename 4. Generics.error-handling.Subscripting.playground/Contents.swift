import Cocoa

var str = "Hello, playground"

func swapGenerics<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = 7
var b = 8
swapGenerics(a: &a, b: &b)
print(a,b)

func testGenerics<T, E>(a: T, b: E) {
    print("\(a) \(b)")
}
testGenerics(a: "a", b: 2)

class List<T> {
    var items = [T]()
    
    func add(item: T) {
        items.append(item)
    }
    
    func getItem(at index: Int) -> T? {
        guard items.count > index else { return nil }
        return items[index]
    }
}

var list = List<Int>()
list.add(item: 1)
list.add(item: 2)
list.add(item: 3)
list.getItem(at: 2)

extension List where T: Numeric {
    func sum() -> T {
//        return items.reduce(0, +)
        return items.reduce(0) { (x, y) -> T in
            return x + y
        }
    }
}

list.sum()

extension List: Equatable where T: Equatable {
    static func ==(l1:List, l2:List) -> Bool {
        if l1.items.count != l2.items.count {
            return false
        }
//        “This function will loop through two sequences, in our case arrays, simultaneously and create pairs (e1 and e2) that we can compare.”
//
//        Excerpt From: Jon Hoffman. “Mastering Swift 5.” Apple Books. 
        for (e1, e2) in zip(l1.items, l2.items) {
            if e1 != e2 {
                return false
            }
        }
        return true
    }
}
