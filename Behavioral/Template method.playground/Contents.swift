//Вариант с супер классом

//class DriveVehicle {
//
//    final func startVehicle() { //помечаем как final, чтобы не было возможности этот шаблонный метод переопределить в классах наследниках
//        haveASeat()
//        useProtection()
//        lookAtTheMirror()
//        turnSignal()
//        driveForward()
//    }
//
//    func haveASeat() {
//        preconditionFailure("this metod should be overriden") //для того, чтобы при попытке вызова стандартного метода вылетала ошибка
//    }
//
//    func useProtection() {
//        preconditionFailure("this metod should be overriden")
//    }
//
//    func lookAtTheMirror() {
//        preconditionFailure("this metod should be overriden")
//    }
//
//    func turnSignal() {
//        preconditionFailure("this metod should be overriden")
//    }
//
//    func driveForward() {
//        preconditionFailure("this metod should be overriden")
//    }
//}
//class Car: DriveVehicle {
//
//    override func haveASeat() {
//        print("sit down on a car seat")
//        closeTheDoor()//вызов из метода, который есть в шаблоне
//    }
//
//    func closeTheDoor() {// если хотим добавить какой то специфический метод, которого нет в шаблоне, то реализуем его в классе и вызываем из того метода, который есть в шаблоне
//        print("close the door")
//    }
//    override func useProtection() {
//        print("fasten seat belt")
//    }
//
//    override func lookAtTheMirror() {
//        print("look at the rearview mirror")
//    }
//
//    override func turnSignal() {
//        print("turn on left turn light")
//    }
//
//    override func driveForward() {
//        print("push pedal")
//    }
//}
//
//class Bicycle: DriveVehicle {
//
//    override func haveASeat() {
//        print("sit down on a bicycle seat")
//    }
//
//    override func useProtection() {
//        print("wear a helmet")
//    }
//
//    override func lookAtTheMirror() {
//        print("look at the little mirror")
//    }
//
//    override func turnSignal() {
//        print("show left hand")
//    }
//
//    override func driveForward() {
//        print("pedal")
//    }
//}
//let car = Car()
//let bicycle = Bicycle()
//
//car.startVehicle()
//print("###########")
//bicycle.startVehicle()



//Реализация через протокол
protocol DriveVehicle {
    func haveASeat()
    func closeTheDoor()
    func useProtection()
    func lookAtTheMirror()
    func turnSignal()
    func driveForward()
    func startVehicle()
}

extension DriveVehicle {//Задаем реализацию методов по умолчанию
    
    func startVehicle() {
        haveASeat()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("this method should be overriden")
    }
    
    func closeTheDoor() {
        //для реализации дополнительного действия для какого то конккретного класса, создаем метод пустышку(их еще называют методы перехватчики, в классе, где этот метод будет использоваться, переопределяем его реализацию, в классах где он не используется, метод ничего не делает, так как он по умолчанию пустой.∞
    }
    
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    
    func lookAtTheMirror() {
        preconditionFailure("this method should be overriden")
    }
    
    func turnSignal() {
        preconditionFailure("this method should be overriden")
    }
    
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
}

class Bicycle: DriveVehicle {
    
    func haveASeat() {
        print("sit down on a bicycle seat")
    }
    
    func useProtection() {
        print("wear a helmet")
    }
    
    func lookAtTheMirror() {
        print("look at the little mirror")
    }
    
    func turnSignal() {
        print("show left hand")
    }
    
    func driveForward() {
        print("pedal")
    }
}

class Car: DriveVehicle {
    
    func haveASeat() {
        print("sit down on a car seat")
        closeTheDoor()
    }
    
    func closeTheDoor() {
        print("close the door")
    }

    func useProtection() {
        print("fasten seat belt")
    }
    
    func lookAtTheMirror() {
        print("look at the rearview mirror")
    }
    
    func turnSignal() {
        print("turn on left turn light")
    }
    
    func driveForward() {
        print("push pedal")
    }
}


let car = Car()
let bicycle = Bicycle()

car.startVehicle()
print("###########")
bicycle.startVehicle()









