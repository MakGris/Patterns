protocol Vehicle {
    
    func drive()
}

class Car: Vehicle {
    func drive() {
        print("You drive a car")
    }
    
}

class Truck: Vehicle {
    func drive() {
        print("You drive a truck")
    }
    
}

class Bus: Vehicle {
    func drive() {
        print("You drive a bus")
    }
    
}

protocol ProduceVehicle {
    
    func produceVehicle() -> Vehicle
}

class CarFactory: ProduceVehicle {
    func produceVehicle() -> Vehicle {
        Car()
    }
    
    
}

class TruckFactory: ProduceVehicle {
    func produceVehicle() -> Vehicle {
        Truck()
    }
}

class BusFactory: ProduceVehicle {
    func produceVehicle() -> Vehicle {
        Bus()
    }
}

let carFactory = CarFactory()
let truckFactory = TruckFactory()
let busFactory = BusFactory()

let car = carFactory.produceVehicle()
let truck = truckFactory.produceVehicle()
let bus = busFactory.produceVehicle()

car.drive()
truck.drive()
bus.drive()
