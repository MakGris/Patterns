protocol SwimBehaivor {
    func swim()
}

class NotASwimmer: SwimBehaivor {
    func swim() {
        print("Can't swim")
    }
}

class NewbieSwimmer: SwimBehaivor {
    func swim() {
        print("Newbie swimmer")
    }
}

class ProfessionalSwimmer: SwimBehaivor {
    func swim() {
        print("Professional swimmer")
    }
}

protocol DiveBehaivor {
    func dive()
}

class NotADiver: DiveBehaivor {
    func dive() {
        print("Can't dive")
    }
}

class NewbieDiver: DiveBehaivor {
    func dive() {
        print("Newbie diver")
    }
}

class ProfessionalDiver: DiveBehaivor {
    func dive() {
        print("Professional diver")
    }
}


class Human {
    
    private var swimBehaivor: SwimBehaivor
    private var diveBehaivor: DiveBehaivor
    
    
    func setSwimBehaivor(sb: SwimBehaivor) {
        swimBehaivor = sb
    }
    
    func setDiveBehaivor(db: DiveBehaivor) {
        diveBehaivor = db
    }
    
    func performSwim() {
        swimBehaivor.swim()
    }
    
    func performDive() {
        diveBehaivor.dive()
    }
    
    func run() {
        print("run")
    }
    
    init(swimBehaivor: SwimBehaivor, diveBehaivor: DiveBehaivor) {
        self.swimBehaivor = swimBehaivor
        self.diveBehaivor = diveBehaivor
    }
    
}

let human = Human(swimBehaivor: NewbieSwimmer(), diveBehaivor: NotADiver())

human.performSwim()
human.performDive()

human.setDiveBehaivor(db: ProfessionalDiver())
human.setSwimBehaivor(sb: NotASwimmer())

human.performSwim()
human.performDive()
