import Foundation

// ARC (Automatic Reference Counter) - Model the lifetime of objects and their relationships.
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "John Appleseed")
//
//reference2 = reference1
//reference3 = reference1
//
//reference1 = nil
//reference2 = nil
//
//reference3 = nil

// Here's how memory deallocate exactly after all the latest strong references were removed.
// by doing this the week references making unvaluable after removing the strong references because it will automatically deallocated the memory by using ARC
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}


class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?


john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")


john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

// expressions: prefix expressions, infix expressions, primary expressions, and postfix expressions
// try applies to both function calls
//sum = try someThrowingFunction() + anotherThrowingFunction()
//
//
//// try applies to both function calls
//sum = try (someThrowingFunction() + anotherThrowingFunction())
//
//
//// Error: try applies only to the first function call
//sum = (try someThrowingFunction()) + anotherThrowingFunction()


let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
// Match only non-nil values.
for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}
