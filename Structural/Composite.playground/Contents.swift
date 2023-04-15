protocol Coworker {
    var level: Int { get }
    func hire(coworker: Coworker)
    func getinfo()
}

class Manager: Coworker {
    
    private var coworkers = [Coworker]()
    var level: Int
    
    init(lvl: Int) {
        self.level = lvl
    }
    
    func hire(coworker: Coworker) {
        coworkers.append(coworker)
    }
    
    func getinfo() {
        print("\(level) level manager")
        
        for coworker in coworkers {
            coworker.getinfo()
        }
    }
    
}

class lowLevelManager: Coworker {
    
    var level: Int
    
    init(lvl: Int) {
        self.level = lvl
    }
    
    func hire(coworker: Coworker) {
        print("Can't hire")
    }
    
    func getinfo() {
        print("\(level) level manager")
    }
    
}


let topManager = Manager(lvl: 1)

let middleManager1 = Manager(lvl: 2)
let middleManager2 = Manager(lvl: 2)

let lowManager1 = lowLevelManager(lvl: 3)
let lowManager2 = lowLevelManager(lvl: 3)
let lowManager3 = lowLevelManager(lvl: 3)
let lowManager4 = lowLevelManager(lvl: 3)

topManager.hire(coworker: middleManager1)
topManager.hire(coworker: middleManager2)

middleManager1.hire(coworker: lowManager1)
middleManager1.hire(coworker: lowManager2)

middleManager2.hire(coworker: lowManager3)
middleManager2.hire(coworker: lowManager4)

topManager.getinfo()
