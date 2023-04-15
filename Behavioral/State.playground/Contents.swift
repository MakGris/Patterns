protocol State {
    func turnOn(printer: Printer)
    func turnOff(printer: Printer)
    func printing(printer: Printer)
}



class On: State {
    func turnOn(printer: Printer) {
        print("Printer already on")
    }
    
    func turnOff(printer: Printer) {
        print("Turning off....")
        printer.set(state: Off())
    }
    
    func printing(printer: Printer) {
        print("printing")
        printer.set(state: Print())
    }
}

class Off: State {
    func turnOn(printer: Printer) {
        print("Printer turning on")
    }
    
    func turnOff(printer: Printer) {
        print("Printer already off!")
    }
    
    func printing(printer: Printer) {
        print("Print Error: Printer is off")
        
    }
    
}

class Print: State {
    func turnOn(printer: Printer) {
        print("Printer already on")
    }
    
    func turnOff(printer: Printer) {
        print("Turning off")
        printer.set(state: Off())
    }
    
    func printing(printer: Printer) {
        print("Print Error: Printer already printing!")
        
    }
    
}


class Printer {
    var state: State
    
    init() {
        self.state = On()
    }
    
    func set(state: State) {
        self.state = state
    }
    
    func turnOn() {
        state.turnOn(printer: self)
    }
    
    func turnOff() {
        state.turnOff(printer: self)
    }
    
    func print() {
        state.printing(printer: self)
    }
}

let printer = Printer()
printer.turnOn()
printer.print()
printer.print()
printer.turnOff()
printer.print()
