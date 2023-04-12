class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init (goodDriver: Bool, name: String) {
        self.isGoodDriver = goodDriver
        self.name = name
    }
}

protocol BasicIterator: IteratorProtocol {
    init(drivers: [Driver])
    func next() -> Driver?
    func allDrivers() -> [Driver]
    
}

class Car {
    
    var goodDriverIterator: GoodDriverIterator {
        GoodDriverIterator(drivers: drivers)
    }
    
    var badDriverIterator: BadDriverIterator {
        BadDriverIterator(drivers: drivers)
    }
    
    private let drivers: [Driver] = [Driver(goodDriver: true, name: "Mark"),Driver(goodDriver: false, name: "Anton"),Driver(goodDriver: true, name: "Maria"),Driver(goodDriver: true, name: "Michael")]
}

extension Car: Sequence {
    
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    
}
class GoodDriverIterator: BasicIterator {
    
    private var drivers: [Driver]
    var current = 0
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter{$0.isGoodDriver == true}
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }

    
}

class BadDriverIterator: BasicIterator {
    
    private var drivers: [Driver]
    var current = 0
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter{$0.isGoodDriver == false}
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }

    
}

let car = Car()
let goodDriverIterator = car.goodDriverIterator
let badDriverIterator = car.badDriverIterator

let allGoodDrivers = goodDriverIterator.allDrivers()
let allBadDrivers = badDriverIterator.allDrivers()

let goodDriver = goodDriverIterator.next()
let badDriver = badDriverIterator.next()

for driver in car {
    print(driver.name)
}

