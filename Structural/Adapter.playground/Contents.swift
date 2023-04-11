//adaptee
class SimpleCar {
    func sound() -> String {
        return "tr-tr-tr"
    }
}
//target
protocol SuperCarProtocol {
    func makeNoise() -> String
}

class SuperCar: SuperCarProtocol {
    func makeNoise() -> String {
        return "wroom-wroom"
    }
}
//adaptor
class SuperCarAdaptor: SuperCarProtocol {
    
    var car: SimpleCar
    
    init(car: SimpleCar) {
        self.car = car
    }
    func makeNoise() -> String {
        car.sound()
    }
}

let simpleCar = SimpleCar()

let adaptor = SuperCarAdaptor(car: simpleCar)
adaptor.makeNoise()
