enum TypeCar {
    case HugeCar
    case FastCar
}

protocol Car {
    
    func drive()
}

class HugeCar: Car {
    
    func drive() {
        print("You drive hug car")
    }
}

class FastCar: Car {
    
    func drive() {
        print("You drive fast car")
    }
}

class CarFactory {
    static func produceCar(type: TypeCar) -> Car {
        var car: Car
        
        switch type {
            
        case .HugeCar:
            car = HugeCar()
        case .FastCar:
            car = FastCar()
        }
        return car
    }
}

let hugeCar = CarFactory.produceCar(type: .HugeCar)
let fastCar = CarFactory.produceCar(type: .FastCar)

hugeCar.drive()
fastCar.drive()
