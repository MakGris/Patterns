protocol Car {
    func drive()
}

protocol Bus {
    func drive()
}

class LittleSizeCar: Car {
    func drive() {
        print("You drive a little size car")
    }
    
    
}

class MiddleSizeCar: Car {
    func drive() {
        print("You drive a middle size car")
    }
    
    
}

class LittleSizeBus: Bus {
    func drive() {
        print("You drive a little size bus")
    }
    
    
}

class MiddleSizeBus: Bus {
    func drive() {
        print("You drive a middle size bus")
    }
    
    
}

protocol Factory {
    func produceCar() -> Car
    func produceBus() -> Bus
}

class LittleSizeFactory: Factory {
    func produceCar() -> Car {
        print("Little size car produced")
        return LittleSizeCar()
    }
    
    func produceBus() -> Bus {
        print("Little size bus produced")
        return LittleSizeBus()
    }
    
    
}

class MiddleSizeFactory: Factory {
    func produceCar() -> Car {
        print("Middle size car produced")
        return MiddleSizeCar()
    }
    
    func produceBus() -> Bus {
        print("Middle size bus produced")
        return MiddleSizeBus()
    }
}

let littleSizeFactory = LittleSizeFactory()
let middleSizeFactory = MiddleSizeFactory()

let littleCar = littleSizeFactory.produceCar()
let middleCar = middleSizeFactory.produceCar()

let littleBus = littleSizeFactory.produceBus()
let middleBus = middleSizeFactory.produceBus()
