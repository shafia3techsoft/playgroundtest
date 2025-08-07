import Foundation

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

// want to prevent override? use final var, func, class func
// also static methods can not be overridden like static func
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()


// initializers
class User {
    var name: String
    var age: Int

    // Designated initializer (must initialize all stored properties)
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    // Convenience initializer (provides option to initialize specific stored properties in multiple ways)
    convenience init(name: String) {
        self.init(name: name, age: 18) // Default age
    }
}

// Error Handling
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0


    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }


        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }


        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }


        coinsDeposited -= item.price


        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem


        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

// Concurrency using DispatchGroup
let group = DispatchGroup()
var results: [String] = []

//for i in 1...3 {
//    group.enter()
//    DispatchQueue.global().async {
//        results.append("Task \(i)")
//        group.leave()
//    }
//}

//group.notify(queue: .main) {
//    print("All done: \(results)")
//}

// // Concurrency using TaskGroup
await withTaskGroup(of: String.self) { group in
    for i in 1...3 {
        group.addTask {
            return "Task \(i)"
        }
    }

    for await result in group {
        print(result)
    }
}

// Generics
import Foundation
import CoreGraphics

//let x: CGFloat = 1.0
//


func perform<N: Numeric>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N {
    op(lhs, rhs)
}


//perform(+, on: 10.1, and: 20.2)

perform(+, on: 10, and: 20)
perform(-, on: 10, and: 20)
perform(*, on: 10, and: 20)
perform(/, on: 10, and: 20)

func perform2<N>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N where N: Numeric{
    op(lhs, rhs)
}


//perform(+, on: 10.1, and: 20.2)

perform2(+, on: 10, and: 20)
perform2(-, on: 10, and: 20)
perform2(*, on: 10, and: 20)
perform2(/, on: 10, and: 20)


protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        "Jumping..."
    }
    func run(){
        "Running..."
    }
}

// can add multiple generics
func jumpAndRun<T: CanJump & CanRun>(_ value: T){
//    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(person)


// access specifiers
open class SomeOpenClass {}
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

//Only classes and overridable class members can be declared 'open'
//open var someOpenVariable = 0
public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}




// GPS Tagg App
// Suggestion: give user option to view or advance search by location, people, event, capture date  functionality to categarize images based on location name, events, person names and capture dates and also can detect/recognize faces of persons in respective media (Photos, Videos etc), use case: user can view speciftc memory simply by searching with keywords. it will also help user quickly findout specific memories within no time, for face detect can use haarcascade frontal face detection and to recognize faces there are many pre-trained model available officially one of them is: https://pypi.org/project/face-recognition/

// AR Drawings App
// As i mostly watch animes so i like this idea and also i am looking for such application that uses Augumented Reality(AR) or Virtual Reality(VR), Suggestion: can also add background remove feature to images, As today i tested it and finding out if there's any feature available within the app that will remove the background so that i can focus only on the specfic area of the drawing what i want to draw, as there are a lot of background remover tools available already can follow alog and add it easily using pre-built API for e.g https://www.remove.bg/api will be the best option

// Review AI Keyboard App
// Suggestions: As ai tasks section can be improved by adding fitness, workout and personalized meal plans (by considering previous meals of the last week or we can say last 2 weeks), the ai writen material is plagaeized so can add ai plag remove tool in education section of Ai tasks as now a days most of people esacially foreign students finding writing tools with no/zero plag and also they're paying a lot to content writers for papers, bestest ai plag remove API https://developers.turnitin.com/turnitin-core-api , also can add text to speech functionality use cases: so speech can be downloaded and can be added as voice note with each presentation slide in place of speaker notes, or can be send as voice note whatsaap or any social app as many people avoid reading text messages due to lack of edu or may be time taking concerns and likes chatting through voice notes (who will use it: the people don't like to send notes of their own voice because of some privacy concerns, person can't record voice note because of background noise or can be many reasons, also this is great because we know now a days traning models on others voices and making irrelevant content is very much in) above functionalities are targeting current issues
