protocol Porsche {
    func getPrice() -> Int
    func getDescription() -> String
}

class Boxter: Porsche {
    func getPrice() -> Int {
        120
    }
    
    func getDescription() -> String {
        "Porsche Boxter"
    }
    
}

class PorscheDecorator: Porsche {
    
    private let decoratedPorsche: Porsche
    
    required init(dp: Porsche) {
        self.decoratedPorsche = dp
    }
    func getPrice() -> Int {
        decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        decoratedPorsche.getDescription()
    }
}

class PremiumSoundSystem: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Int {
        super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        super.getDescription() + " Premium sound system"
    }
}

class PanoramicSunRoof: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Int {
        super.getPrice() + 40
    }
    override func getDescription() -> String {
        super.getDescription() + " Panoramic sun roof"
    }
}

var boxter: Porsche = Boxter()
print(boxter.getPrice())
print(boxter.getDescription())
boxter = PremiumSoundSystem(dp: boxter)
print(boxter.getPrice())
print(boxter.getDescription())
boxter = PanoramicSunRoof(dp: boxter)
print(boxter.getPrice())
print(boxter.getDescription())


